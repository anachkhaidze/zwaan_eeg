% Initialize EEGLAB
[ALLEEG, EEG, CURRENTSET, ALLCOM] = eeglab;

% Define the folder containing the .set files to which ICA weights will be applied
data_folder_resampled = 'C:\Users\kiyonagalabadmin\Desktop\zv_data\data\data_set_files';

% Get a list of all .set files ending with _resampled.set
set_files_resampled = dir(fullfile(data_folder_resampled, '*_resampled.set'));

% Define the folder where the ICA weights were saved
data_folder_1hz = 'C:\Users\kiyonagalabadmin\Desktop\zv_data\data\data_set_files\ica_1hz';

% Define the EOG channels to be excluded and re-added
eog_channels = {'TP8', 'FT9', 'FT10'};

% Initialize a cell array to store files that couldn't be processed
missing_ica_files = {};

% Loop through each .set file and apply ICA weights
for i = 1:length(set_files_resampled)
    try
        % Step 1: Load the .set file
        filename = set_files_resampled(i).name;
        filepath = fullfile(data_folder_resampled, filename);
        fprintf('Loading file: %s\n', filepath);
        EEG = pop_loadset('filename', filename, 'filepath', data_folder_resampled);
        
        % Debug: Print the number of channels in EEG data
        fprintf('Number of channels in EEG data: %d\n', EEG.nbchan);
        
        % Step 2: Load the corresponding ICA weights
        weights_filename = [filename(1:end-4), '_1Hz_ica_weights.mat'];
        weights_filepath = fullfile(data_folder_1hz, weights_filename);
        fprintf('Loading ICA weights from: %s\n', weights_filepath);
        
        if exist(weights_filepath, 'file')
            loaded_data = load(weights_filepath);  % Changed to 'loaded_data' to avoid overwriting variables
            ica_weights = loaded_data.ica_weights;
            ica_sphere = loaded_data.ica_sphere;
            fprintf('ICA weights loaded successfully.\n');
        else
            error('ICA weights file not found for file: %s\n', weights_filename);
        end
        
        % Debug: Print the size of ICA weights
        fprintf('Size of ICA weights: %d x %d\n', size(ica_weights, 1), size(ica_weights, 2));
        
        % Step 3: Exclude EOG channels from EEG data
        eeg_channel_indices = find(~ismember({EEG.chanlocs.labels}, eog_channels));
        EEG_excluded = EEG;
        EEG_excluded.data = EEG.data(eeg_channel_indices, :);
        EEG_excluded.nbchan = length(eeg_channel_indices);
        EEG_excluded.chanlocs = EEG.chanlocs(eeg_channel_indices);
        
        % Debug: Print the number of channels in EEG data after excluding EOG channels
        fprintf('Number of channels in EEG data after excluding EOG channels: %d\n', EEG_excluded.nbchan);
        
        % Step 4: Match channels between EEG data and ICA weights
        if size(EEG_excluded.data, 1) ~= size(ica_weights, 2)
            error('The number of channels in EEG data does not match the number of channels in ICA weights for file: %s\n', filename);
        end
        
        % Step 5: Apply the ICA weights
        EEG_excluded.icaweights = ica_weights;
        EEG_excluded.icasphere = ica_sphere;
        EEG_excluded.icachansind = 1:EEG_excluded.nbchan;
        EEG_excluded = eeg_checkset(EEG_excluded);
        EEG_excluded.icaact = (EEG_excluded.icaweights * EEG_excluded.icasphere) * EEG_excluded.data(EEG_excluded.icachansind, :);
        fprintf('ICA weights applied successfully.\n');
        
        % Step 6: Add back the excluded EOG channels
        eog_data = EEG.data(ismember({EEG.chanlocs.labels}, eog_channels), :);
        EEG.data = [EEG_excluded.data; eog_data];
        EEG.nbchan = size(EEG.data, 1);
        EEG.chanlocs = [EEG_excluded.chanlocs, EEG.chanlocs(ismember({EEG.chanlocs.labels}, eog_channels))];
        
        % Ensure the ICA fields are correctly transferred back
        EEG.icaweights = EEG_excluded.icaweights;
        EEG.icasphere = EEG_excluded.icasphere;
        EEG.icachansind = EEG_excluded.icachansind;
        EEG.icaact = EEG_excluded.icaact;

        % Step 7: Save the new dataset with applied ICA weights
        new_filename = [filename(1:end-13), '_resampled_ica.set'];  % Adjusted to retain the full structure
        new_filepath = fullfile(data_folder_resampled, new_filename);
        EEG = pop_saveset(EEG, 'filename', new_filename, 'filepath', data_folder_resampled);
        
        % Verify if the file was saved
        if exist(new_filepath, 'file')
            fprintf('ICA weights applied and dataset saved for file: %s\n', new_filepath);
        else
            error('Failed to save the dataset for file: %s\n', new_filepath);
        end
        
    catch ME
        fprintf('Error processing file: %s\n', filename);
        fprintf('Error message: %s\n', ME.message);
        fprintf('Stack trace:\n');
        for k = 1:length(ME.stack)
            fprintf('File: %s\nName: %s\nLine: %d\n', ME.stack(k).file, ME.stack(k).name, ME.stack(k).line);
        end
        % Store the filename for missing ICA weights files
        missing_ica_files{end+1} = filename; %#ok<AGROW>
        continue; % Skip to the next file if an error occurs
    end
end

% Print missing ICA weights files
if ~isempty(missing_ica_files)
    fprintf('The following files were not processed due to missing ICA weights:\n');
    for i = 1:length(missing_ica_files)
        fprintf('%s\n', missing_ica_files{i});
    end
end

disp('ICA application complete for all _resampled files.');
