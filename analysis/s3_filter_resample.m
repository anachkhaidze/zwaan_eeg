% Initialize EEGLAB
[ALLEEG, EEG, CURRENTSET, ALLCOM] = eeglab;

% Define directories
inputDir = 'C:\Users\kiyonagalabadmin\Desktop\zv_data\data\data_set_files';
outputDir = 'C:\Users\kiyonagalabadmin\Desktop\zv_data\data\data_set_files\ica_1hz';

% Get list of all referenced .set files in the input directory ending with _ref_trim.set
refTrimSetFiles = dir(fullfile(inputDir, '*_ref_trim.set'));

% Process each referenced and trimmed .set file
for i = 1:length(refTrimSetFiles)
    refTrimSetFilename = refTrimSetFiles(i).name;
    try
        % Load the referenced and trimmed .set file
        EEG = pop_loadset('filename', refTrimSetFilename, 'filepath', inputDir);
        [ALLEEG, EEG, CURRENTSET] = eeg_store(ALLEEG, EEG, 0);
        disp(['Loaded referenced and trimmed .set file: ', refTrimSetFilename]);

        % Save original sampling rate for verification
        original_srate = EEG.srate;
        disp(['Original sampling rate: ', num2str(original_srate), ' Hz']);

        % Step 1: Apply IIR Butterworth high-pass and low-pass filter using ERPLAB
        EEG = pop_basicfilter(EEG, 1:EEG.nbchan, 'Boundary', 'boundary', 'Cutoff', [0.1 40], ...
            'Design', 'butter', 'Filter', 'bandpass', 'Order', 2);
        disp('Applied IIR Butterworth high-pass filter at 0.1 Hz and low-pass filter at 40 Hz.');

        % If running ICA, first filter with 1Hz
        % EEG = pop_basicfilter(EEG, 1:EEG.nbchan, 'Boundary', 'boundary', 'Cutoff', [1 40], ...
        %     'Design', 'butter', 'Filter', 'bandpass', 'Order', 2);
        % disp('Applied IIR Butterworth high-pass filter at 0.1 Hz and low-pass filter at 40 Hz.');

        % Step 2: Downsample to 512 Hz
        EEG = pop_resample(EEG, 512);
        disp(['Downsampled to: ', num2str(EEG.srate), ' Hz']);

        % Verify downsampling
        if EEG.srate ~= 512
            error('Downsampling failed. Current sampling rate: %d Hz', EEG.srate);
        end

        % Create the new filename by retaining '_ref_trim' and adding '_filt_resampled'
        [~, name, ext] = fileparts(refTrimSetFilename);
        filteredSetFilename = [name, '_filt_resampled_1Hz', ext];

        % Save the filtered and downsampled dataset
        EEG = pop_saveset(EEG, 'filename', filteredSetFilename, 'filepath', outputDir);
        disp(['Saved filtered and downsampled .set file: ', fullfile(outputDir, filteredSetFilename)]);

    catch ME
        disp(['Error processing file: ', refTrimSetFilename]);
        disp(ME.message);
    end
end

% Final message
disp('Filtering and downsampling completed.');
