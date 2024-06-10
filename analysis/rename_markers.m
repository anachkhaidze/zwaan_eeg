% Initialize EEGLAB
[ALLEEG, EEG, CURRENTSET, ALLCOM] = eeglab;

% Define the folder containing the .set files
data_folder = 'C:\Users\kiyonagalabadmin\Desktop\zv_data\data\data_set_files';

% Get a list of all .set files ending with _trim.set
set_files = dir(fullfile(data_folder, '*_ref.set'));

% Define the unique marker and the new name for the preceding marker
unique_marker = 'S 9';  % The marker after which we want to rename the preceding marker
new_marker_name = 'S 8';  % Replace with the desired new marker name

% Loop through each .set file and rename markers
for i = 1:length(set_files)
    try
        % Load the .set file
        filename = set_files(i).name;
        filepath = fullfile(data_folder, filename);
        EEG = pop_loadset('filename', filename, 'filepath', data_folder);
        [ALLEEG, EEG, CURRENTSET] = eeg_store(ALLEEG, EEG, 0);
        
        % Print initial event markers
        fprintf('Initial event markers in file %s:\n', filename);
        for j = 1:length(EEG.event)
            fprintf('Event %d: %s\n', j, EEG.event(j).type);
        end
        
        % Initialize a list to store indices of markers to rename
        markers_to_rename = [];

        % Loop through events and find the ones to rename
        for j = 2:length(EEG.event)
            if strcmp(EEG.event(j).type, unique_marker)
                fprintf('Found %s at index %d in file %s\n', unique_marker, j, filename);
                if strcmp(EEG.event(j-1).type, 'S 6')
                    fprintf('Renaming marker %s at index %d to %s\n', EEG.event(j-1).type, j-1, new_marker_name);
                    markers_to_rename(end+1) = j-1;  %#ok<AGROW>
                end
            end
        end
        
        % Rename the markers
        for idx = markers_to_rename
            EEG.event(idx).type = new_marker_name;
        end

        % Print final event markers
        fprintf('Final event markers in file %s:\n', filename);
        for j = 1:length(EEG.event)
            fprintf('Event %d: %s\n', j, EEG.event(j).type);
        end
        
        % Save the updated dataset
        new_filename = strrep(filename, '_ref.set', '_ref_renamed.set');
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

disp('Marker renaming complete for all files.');
