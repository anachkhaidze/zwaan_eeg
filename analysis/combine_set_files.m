% Initialize EEGLAB
[ALLEEG, EEG, CURRENTSET, ALLCOM] = eeglab;

% Define the folder containing the .vhdr and .eeg files
data_folder = 'C:\Users\kiyonagalabadmin\Desktop\zv_data\data';

% Define the filenames
file1_vhdr = 'sub009zv.vhdr';
file2_vhdr = 'sub009zv_blocks3_6.vhdr';

% Construct full file paths
file1_vhdr_path = fullfile(data_folder, file1_vhdr);
file2_vhdr_path = fullfile(data_folder, file2_vhdr);

% Extract corresponding .eeg filenames from the .vhdr files
file1_eeg = strrep(file1_vhdr, '.vhdr', '.eeg');
file2_eeg = strrep(file2_vhdr, '.vhdr', '.eeg');

% Construct full paths for .eeg files
file1_eeg_path = fullfile(data_folder, file1_eeg);
file2_eeg_path = fullfile(data_folder, file2_eeg);

% Check if the .vhdr and corresponding .eeg files exist
if ~exist(file1_vhdr_path, 'file')
    error('Header file not found: %s', file1_vhdr_path);
end
if ~exist(file2_vhdr_path, 'file')
    error('Header file not found: %s', file2_vhdr_path);
end
if ~exist(file1_eeg_path, 'file')
    error('Binary file not found: %s', file1_eeg_path);
end
if ~exist(file2_eeg_path, 'file')
    error('Binary file not found: %s', file2_eeg_path);
end

% Load the first dataset
EEG1 = pop_loadbv(data_folder, file1_vhdr);
[ALLEEG, EEG1, CURRENTSET] = eeg_store(ALLEEG, EEG1, 0);

% Load the second dataset
EEG2 = pop_loadbv(data_folder, file2_vhdr);
[ALLEEG, EEG2, CURRENTSET] = eeg_store(ALLEEG, EEG2, 0);

% Check if datasets have the same channel locations, sample rate, etc.
if ~isequal(EEG1.chanlocs, EEG2.chanlocs) || EEG1.srate ~= EEG2.srate
    error('Datasets have different channel locations or sample rates.');
end

% Append the second dataset to the first one
EEG_combined = pop_mergeset(EEG1, EEG2);

% Save the combined dataset
combined_filename = 'sub009zv_combined.set';
EEG_combined = pop_saveset(EEG_combined, 'filename', combined_filename, 'filepath', data_folder);
disp(['Combined dataset saved as: ', fullfile(data_folder, combined_filename)]);
