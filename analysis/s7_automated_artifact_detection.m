% Initialize EEGLAB
[ALLEEG, EEG, CURRENTSET, ALLCOM] = eeglab;

% Define the folder containing the .set files
data_folder = 'C:\Users\kiyonagalabadmin\Desktop\zv_data\data\data_set_files';

% Get a list of all .set files ending with _channel_subset.set
set_files = dir(fullfile(data_folder, '*.set'));

% Initialize a cell array to store files with over 40% rejection
high_rejection_files = {};

% Loop through each file and apply artifact detection
for i = 1:length(set_files)
    try
        % Load the .set file
        filename = set_files(i).name;
        filepath = fullfile(data_folder, filename);
        EEG = pop_loadset('filename', filename, 'filepath', data_folder);
        [ALLEEG, EEG, CURRENTSET] = eeg_store(ALLEEG, EEG, 0);
        
        % Define the test period based on actual data
        % The test period should be within the range of the epoch length
        % Adjusting to be slightly within the actual range
        test_period_start = EEG.xmin * 1000 + 1; % in ms
        test_period_end = EEG.xmax * 1000 - 1;   % in ms
        
        % Perform artifact detection using Moving window peak-to-peak
        EEG = pop_artmwppth(EEG, 'Channel', 1:13, 'Flag', 1, 'Threshold', 50, ...
                            'Twindow', [test_period_start test_period_end], ...
                            'Windowsize', 200, 'Windowstep', 100);
        
        % Check if rejection marks are present
        if isempty(EEG.reject.rejmanual)
            warning('No rejection marks found for file: %s', filename);
            continue;
        end

        % Calculate rejection rates for each bin
        total_epochs = EEG.trials;
        rejected_epochs = sum(EEG.reject.rejmanual);
        rejection_rate = (rejected_epochs / total_epochs) * 100;
        
        % Print rejection rates for each bin
        fprintf('Rejection rates for file %s:\n', filename);
        fprintf('Overall rejection rate: %.2f%%\n', rejection_rate);

        % Check if over 50% of the data was rejected
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

% Print files with over 50% rejection
fprintf('Files with over 40%% rejection:\n');
for i = 1:length(high_rejection_files)
    fprintf('%s\n', high_rejection_files{i});
end

disp('Artifact detection complete for all files.');
