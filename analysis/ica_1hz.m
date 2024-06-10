% Initialize EEGLAB
[ALLEEG, EEG, CURRENTSET, ALLCOM] = eeglab;

% Define the folder containing the .set files filtered at 1 Hz
data_folder_1Hz = 'C:\Users\kiyonagalabadmin\Desktop\zv_data\data\data_set_files\ica_1hz';

% Get a list of all .set files ending with _1Hz.set
set_files_1Hz = dir(fullfile(data_folder_1Hz, '*_1Hz.set'));

% Loop through each .set file and run ICA
for i = 1:length(set_files_1Hz)
    try
        % Load the .set file
        filename = set_files_1Hz(i).name;
        filepath = fullfile(data_folder_1Hz, filename);
        EEG = pop_loadset('filename', filename, 'filepath', data_folder_1Hz);
        [ALLEEG, EEG, CURRENTSET] = eeg_store(ALLEEG, EEG, 0);

        % Identify EOG channels
        eog_channels = {'TP8', 'FT9', 'FT10'}; % Adjust these names to match your data
        eog_indices = find(ismember({EEG.chanlocs.labels}, eog_channels));
        
        % Exclude EOG channels
        included_channels = setdiff(1:EEG.nbchan, eog_indices);
        EEG.data = EEG.data(included_channels, :);
        EEG.chanlocs = EEG.chanlocs(included_channels);
        EEG.nbchan = length(included_channels);
        
        % Run ICA excluding EOG channels
        EEG = pop_runica(EEG, 'extended', 1);

        % Save the ICA weights
        ica_weights = EEG.icaweights;
        ica_sphere = EEG.icasphere;
        save(fullfile(data_folder_1Hz, [filename(1:end-4), '_ica_weights.mat']), 'ica_weights', 'ica_sphere', 'included_channels');

        % Save the dataset with ICA weights
        EEG = pop_saveset(EEG, 'filename', [filename(1:end-4), '_ica.set'], 'filepath', data_folder_1Hz);
        
        fprintf('ICA weights and dataset saved for file: %s\n', filename);
        
        [ALLEEG, EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    catch ME
        fprintf('Error processing file: %s\n', filename);
        fprintf('Error message: %s\n', ME.message);
        fprintf('Stack trace:\n');
        for k = 1:length(ME.stack)
            fprintf('File: %s\nName: %s\nLine: %d\n', ME.stack(k).file, ME.stack(k).name, ME.stack(k).line);
        end
        continue; % Skip to the next file if an error occurs
    end
end

disp('ICA processing complete for all _1Hz files.');
