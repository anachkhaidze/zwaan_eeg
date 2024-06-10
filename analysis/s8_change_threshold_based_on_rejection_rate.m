% Initialize EEGLAB
[ALLEEG, EEG, CURRENTSET, ALLCOM] = eeglab;

% Define the folder containing the .set files
data_folder = 'C:\Users\kiyonagalabadmin\Desktop\zv_data\data\data_set_files';

% List of datasets to reanalyze
datasets_to_rerun = {
    'sub013zv_ref_trim_filt_resampled_elist_bins_ep_channel_subset.set',
    'sub015zv_ref_trim_filt_resampled_elist_bins_ep_channel_subset.set',
};

% Initialize a cell array to store files with over 40% rejection
high_rejection_files = {};

% Loop through each specified dataset and apply artifact detection
for i = 1:length(datasets_to_rerun)
    try
        % Load the .set file
        filename = datasets_to_rerun{i};
        filepath = fullfile(data_folder, filename);
        EEG = pop_loadset('filename', filename, 'filepath', data_folder);
        [ALLEEG, EEG, CURRENTSET] = eeg_store(ALLEEG, EEG, 0);
        
        % Define the test period based on actual data
        test_period_start = EEG.xmin * 1000 + 1; % in ms
        test_period_end = EEG.xmax * 1000 - 1;   % in ms
        
        % Increased threshold
        threshold = 80;

        % Perform artifact detection using Moving window peak-to-peak
        EEG = pop_artmwppth(EEG, 'Channel', 1:13, 'Flag', 1, 'Threshold', threshold, ...
                            'Twindow', [test_period_start test_period_end], ...
                            'Windowsize', 200, 'Windowstep', 100);
        
        % Check if rejection marks are present
        if isempty(EEG.reject.rejmanual)
            warning('No rejection marks found for file: %s', filename);
            continue;
        end

        % Calculate rejection rates
        total_epochs = EEG.trials;
        rejected_epochs = sum(EEG.reject.rejmanual);
        rejection_rate = (rejected_epochs / total_epochs) * 100;
        
        fprintf('File: %s, Threshold: %d, Rejection Rate: %.2f%%\n', filename, threshold, rejection_rate);

        % Check if over 40% of the data was rejected
        if rejection_rate > 40
            high_rejection_files{end+1} = filename; %#ok<AGROW>
        end
        
        % Save the updated dataset
        new_filename = strrep(filename, '_channel_subset.set', '_channel_subset_aad.set');
        EEG = pop_saveset(EEG, 'filename', new_filename, 'filepath', data_folder);
        
        % Confirm save operation
        if exist(fullfile(data_folder, new_filename), 'file')
            fprintf('Successfully saved: %s\n', new_filename);
        else
            warning('Failed to save: %s\n', new_filename);
        end

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

% Print files with over 40% rejection
fprintf('Files with over 40%% rejection after increasing threshold to 60:\n');
for i = 1:length(high_rejection_files)
    fprintf('%s\n', high_rejection_files{i});
end

disp('Artifact detection complete for specified files.');
