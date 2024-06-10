% Initialize EEGLAB
[ALLEEG, EEG, CURRENTSET, ALLCOM] = eeglab;

% Define the folder containing the .set files
data_folder = 'C:\Users\kiyonagalabadmin\Desktop\zv_data\data\data_set_files';

% Define the critical marker types
critical_markers = {'S  5', 'S  6', 'S  7', 'S  9', 'S 16', 'S 17', 'S 25', 'S 32', 'S 64', 'S 99'};

% Get a list of all .set files ending with _resampled.set
set_files = dir(fullfile(data_folder, '*_resampled.set'));

% Loop through each file and apply the specified preprocessing steps
for i = 1:length(set_files)
    try
        % Load the .set file
        filename = set_files(i).name;
        filepath = fullfile(data_folder, filename);
        EEG = pop_loadset('filename', filename, 'filepath', data_folder);
        [ALLEEG, EEG, CURRENTSET] = eeg_store(ALLEEG, EEG, 0);
        
        % Check if there are events in the dataset
        if isempty(EEG.event)
            warning(['No events found in dataset: ', filename]);
            continue;
        end
        
        % Create an Eventlist for the current dataset
        EEG = pop_creabasiceventlist(EEG, 'BoundaryNumeric', {-99}, 'BoundaryString', {'boundary'}, ...
                                     'Eventlist', '', 'Warning', 'on', ...
                                     'AlphanumericCleaning', 'on');
        
        % Verify Eventlist creation by displaying the EVENTLIST structure
        if isfield(EEG, 'EVENTLIST')
            disp(['Eventlist created successfully for: ', filename]);
            disp(EEG.EVENTLIST); % Display EVENTLIST structure for verification
        else
            warning(['Eventlist was not created for: ', filename]);
        end
        
        % Filter events to keep only critical markers
        event_types = {EEG.event.type};
        critical_markers_str = critical_markers; % critical markers are already strings
        EEG.event = EEG.event(ismember(event_types, critical_markers_str));
        
        % Save the dataset with the new Eventlist
        new_filename = strrep(filename, '_resampled.set', '_resampled_elist.set');
        EEG = pop_saveset(EEG, 'filename', new_filename, 'filepath', data_folder);
        [ALLEEG, EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    catch ME
        fprintf('Error processing file: %s\n', filename);
        fprintf('Error message: %s\n', ME.message);
        fprintf('Stack trace:\n');
        for k = 1:length(ME.stack)
            fprintf('File: %s\nName: %s\nLine: %d\n', ME.stack(k).file, ME.stack(k).name, ME.stack(k).line);
        end
        break; % Stop the loop if an error occurs
    end
end

disp('Eventlist creation complete for all files.');
