% Initialize EEGLAB
[ALLEEG, EEG, CURRENTSET, ALLCOM] = eeglab;

% Define directories
inputDir = 'C:\Users\kiyonagalabadmin\Desktop\zv_data\data';
outputDir = 'C:\Users\kiyonagalabadmin\Desktop\zv_data\data\data_set_files';

% Get list of all .vhdr files in the input directory
vhdrFiles = dir(fullfile(inputDir, '*.vhdr'));

% Process each .vhdr file
for i = 1:length(vhdrFiles)
    vhdrFilename = vhdrFiles(i).name;
    try
        % Load the .vhdr file specifying channels 1 to 63
        EEG = pop_loadbv(inputDir, vhdrFilename, [], 1:63);
        [ALLEEG, EEG, CURRENTSET] = eeg_store(ALLEEG, EEG, 0);
        disp(['Loaded .vhdr file: ', vhdrFilename]);

        % Step 1: Append Fp1 to the channel locations
        if ~ismember('Fp1', {EEG.chanlocs.labels})
            % Create a new structure for Fp1
            Fp1 = struct('labels', 'Fp1', 'type', '', 'theta', [], 'radius', [], 'X', [], 'Y', [], 'Z', [], 'sph_theta', [], 'sph_phi', [], 'sph_radius', [], 'urchan', [], 'ref', '');
            
            % Append the new Fp1 channel to chanlocs
            EEG.chanlocs(end+1) = Fp1;
            EEG.nbchan = EEG.nbchan + 1;
            EEG.data(end+1, :) = 0; % Add zeroed data for the new channel
            
            % Perform a lookup for channel locations
            EEG = pop_chanedit(EEG, 'lookup', 'standard-10-5-cap385.elp');
        end

        % Verify channel addition
        if ~ismember('Fp1', {EEG.chanlocs.labels})
            error('Fp1 channel was not added successfully.');
        end
        disp('Channels after adding Fp1:');
        disp({EEG.chanlocs.labels});
        disp('Number of channels:');
        disp(EEG.nbchan);

        % Step 2: Re-reference to mastoids (TP9 and TP10)
        if ismember('TP9', {EEG.chanlocs.labels}) && ismember('TP10', {EEG.chanlocs.labels})
            % Re-reference the data to TP9 and TP10
            EEG = pop_reref(EEG, {'TP9', 'TP10'}, 'keepref', 'off');
            
            % Add Fp1 back as a non-reference channel
            EEG = pop_chanedit(EEG, 'append', 63, 'changefield', {64, 'labels', 'Fp1'});
        else
            error('TP9 or TP10 not found in the dataset. Please check the channel labels.');
        end

        % Verify re-referencing
        disp('Reference channels:');
        disp(EEG.ref);
        if isempty(EEG.ref)
            error('No reference channels found after re-referencing.');
        end

        % Save intermediate dataset to check re-referencing
        refSetFilename = [strrep(vhdrFilename, '.vhdr', '_ref.set')];
        EEG = pop_saveset(EEG, 'filename', refSetFilename, 'filepath', outputDir);
        disp(['Saved re-referenced .set file: ', fullfile(outputDir, refSetFilename)]);

    catch ME
        disp(['Error processing file: ', vhdrFilename]);
        disp(ME.message);
    end
end

% Final message
disp('Processing completed.');
