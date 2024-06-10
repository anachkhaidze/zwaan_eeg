% Initialize EEGLAB
[ALLEEG, EEG, CURRENTSET, ALLCOM] = eeglab;

% Define the folder containing the .set files
data_folder = 'C:\Users\kiyonagalabadmin\Desktop\zv_data\data\data_set_files';

% Path to the bin descriptor file
bin_descriptor_file = 'C:\Users\kiyonagalabadmin\Desktop\zv_data\data\bin_descriptor.txt';

% Check if the bin descriptor file exists
if ~exist(bin_descriptor_file, 'file')
    error('Bin descriptor file not found: %s', bin_descriptor_file);
end

% Get a list of all .set files ending with _elist.set
set_files = dir(fullfile(data_folder, '*_elist.set'));

% Loop through each file and apply the bin assignment and epoching
for i = 1:length(set_files)
    try
        % Load the .set file
        filename = set_files(i).name;
        filepath = fullfile(data_folder, filename);
        EEG = pop_loadset('filename', filename, 'filepath', data_folder);
        [ALLEEG, EEG, CURRENTSET] = eeg_store(ALLEEG, EEG, 0);
        
        % Assign bins using BINLISTER
        EEG = pop_binlister(EEG, 'BDF', bin_descriptor_file, 'IndexEL', 1, ...
                            'SendEL2', 'EEG', 'Voutput', 'EEG');
        
        % Save the dataset with bins assigned
        new_filename_bins = strrep(filename, '_elist.set', '_elist_bins.set');
        EEG = pop_saveset(EEG, 'filename', new_filename_bins, 'filepath', data_folder);
        [ALLEEG, EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
        
        % Epoching: Extract bin-based epochs
        EEG = pop_epochbin(EEG, [-200.0 800.0], 'pre');
        
        % Save the dataset with epochs extracted
        new_filename_epochs = strrep(new_filename_bins, '_elist_bins.set', '_elist_bins_ep.set');
        EEG = pop_saveset(EEG, 'filename', new_filename_epochs, 'filepath', data_folder);
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

disp('Bin assignment and epoching complete for all files.');
