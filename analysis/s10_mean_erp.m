% Initialize EEGLAB
[ALLEEG, EEG, CURRENTSET, ALLCOM] = eeglab;

% Define the folder containing the .set files
data_folder = 'C:\Users\kiyonagalabadmin\Desktop\zv_data\data\data_set_files';

% Get a list of all .set files ending with _synctrej.set
set_files = dir(fullfile(data_folder, '*_synctrej.set'));

% Loop through each file and apply the averaging process
for i = 1:length(set_files)
    try
        % Load the .set file
        filename = set_files(i).name;
        filepath = fullfile(data_folder, filename);
        EEG = pop_loadset('filename', filename, 'filepath', data_folder);
        [ALLEEG, EEG, CURRENTSET] = eeg_store(ALLEEG, EEG, 0);
        
        % Create the ERP file name
        erp_filename = [filename(1:8) '.erp'];
        erp_filepath = fullfile(data_folder, erp_filename);
        
        % Compute averaged ERPs
        ERP = pop_averager(ALLEEG, 'Criterion', 'good', 'DSindex', CURRENTSET, ...
                           'ExcludeBoundary', 'on', 'SEM', 'on');
        
        % Save the averaged ERP file
        ERP = pop_savemyerp(ERP, 'erpname', erp_filename, 'filename', erp_filepath);
        
        % Confirm save operation
        if exist(erp_filepath, 'file')
            fprintf('Successfully saved: %s\n', erp_filename);
        else
            warning('Failed to save: %s\n', erp_filename);
        end

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

disp('Averaging complete for all files.');
