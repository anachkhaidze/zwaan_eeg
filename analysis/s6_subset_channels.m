% Initialize EEGLAB
[ALLEEG, EEG, CURRENTSET, ALLCOM] = eeglab;

% Define the folder containing the .set files
data_folder = 'C:\Users\kiyonagalabadmin\Desktop\zv_data\data\data_set_files\channel_subset';

% Define the channels to keep
channels_to_keep = {'Cz', 'C1', 'C2', 'C3', 'C4', 'Pz', 'P1', 'P2', 'P3', 'P4', 'CPz', 'CP1', 'CP2'};

% Get a list of all .set files in the folder
set_files = dir(fullfile(data_folder, '*.set'));

% Loop through each file and apply the channel reduction and new channel creation
for i = 1:length(set_files)
    try
        % Load the .set file
        filename = set_files(i).name;
        filepath = fullfile(data_folder, filename);
        EEG = pop_loadset('filename', filename, 'filepath', data_folder);
        [ALLEEG, EEG, CURRENTSET] = eeg_store(ALLEEG, EEG, 0);
        
        % Find indices of channels to keep
        channel_indices_to_keep = find(ismember({EEG.chanlocs.labels}, channels_to_keep));
        
        % Remove all other channels
        EEG = pop_select(EEG, 'channel', channel_indices_to_keep);
        
        % Create the new channel 'centroparietal_cluster' as the average of the kept channels
        centroparietal_cluster_data = mean(EEG.data, 1);
        
        % Add the new channel to the dataset
        EEG.data(end+1, :, :) = centroparietal_cluster_data;
        EEG.nbchan = EEG.nbchan + 1;
        EEG.chanlocs(end+1).labels = 'centroparietal_cluster';
        
        % Update the EEG.chaninfo structure if necessary
        if isfield(EEG, 'chaninfo') && isfield(EEG.chaninfo, 'nosedir')
            EEG.chaninfo.nosedir(end+1) = EEG.chaninfo.nosedir(1); % Copy existing nosedir info
        end
        
        % Save the updated dataset
        new_filename = strrep(filename, '.set', '_channel_subset.set');
        EEG = pop_saveset(EEG, 'filename', new_filename, 'filepath', data_folder);
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

disp('Channel reduction and new channel creation complete for all files.');
% Initialize EEGLAB
[ALLEEG, EEG, CURRENTSET, ALLCOM] = eeglab;

% Define the folder containing the .set files
data_folder = 'C:\Users\kiyonagalabadmin\Desktop\zv_data\data\data_set_files';

% Define the channels to keep
channels_to_keep = {'Cz', 'C1', 'C2', 'C3', 'C4', 'Pz', 'P1', 'P2', 'P3', 'P4', 'CPz', 'CP1', 'CP2'};

% Get a list of all .set files in the folder
set_files = dir(fullfile(data_folder, '*.set'));

% Loop through each file and apply the channel reduction and new channel creation
for i = 1:length(set_files)
    try
        % Load the .set file
        filename = set_files(i).name;
        filepath = fullfile(data_folder, filename);
        EEG = pop_loadset('filename', filename, 'filepath', data_folder);
        [ALLEEG, EEG, CURRENTSET] = eeg_store(ALLEEG, EEG, 0);
        
        % Find indices of channels to keep
        channel_indices_to_keep = find(ismember({EEG.chanlocs.labels}, channels_to_keep));
        
        % Remove all other channels
        EEG = pop_select(EEG, 'channel', channel_indices_to_keep);
        
        % Create the new channel 'centroparietal_cluster' as the average of the kept channels
        centroparietal_cluster_data = mean(EEG.data, 1);
        
        % Add the new channel to the dataset
        EEG.data(end+1, :, :) = centroparietal_cluster_data;
        EEG.nbchan = EEG.nbchan + 1;
        EEG.chanlocs(end+1).labels = 'centroparietal_cluster';
        
        % Update the EEG.chaninfo structure if necessary
        if isfield(EEG, 'chaninfo') && isfield(EEG.chaninfo, 'nosedir')
            EEG.chaninfo.nosedir(end+1) = EEG.chaninfo.nosedir(1); % Copy existing nosedir info
        end
        
        % Save the updated dataset
        new_filename = strrep(filename, '.set', '_channel_subset.set');
        EEG = pop_saveset(EEG, 'filename', new_filename, 'filepath', data_folder);
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

disp('Channel reduction and new channel creation complete for all files.');
