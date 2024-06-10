% Initialize EEGLAB
[ALLEEG, EEG, CURRENTSET, ALLCOM] = eeglab;

% Define the folder containing the .set files
data_folder = 'C:\Users\kiyonagalabadmin\Desktop\zv_data\data\data_set_files';

% Get a list of all .set files ending with _aad.set
set_files = dir(fullfile(data_folder, '*_aad.set'));

% Loop through each file and apply the synchronization process
for i = 1:length(set_files)
    try
        % Load the .set file
        filename = set_files(i).name;
        filepath = fullfile(data_folder, filename);
        EEG = pop_loadset('filename', filename, 'filepath', data_folder);
        [ALLEEG, EEG, CURRENTSET] = eeg_store(ALLEEG, EEG, 0);

        % Synchronize artifact info in EEG and EVENTLIST
        EEG = pop_syncroartifacts(EEG, 'Direction', 'eeglab2erplab');

        % Save the updated dataset
        new_filename = strrep(filename, '_aad.set', '_aad_synctrej.set');
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

disp('Synchronization complete for all files.');
