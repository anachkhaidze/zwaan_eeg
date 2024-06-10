% Initialize EEGLAB
[ALLEEG, EEG, CURRENTSET, ALLCOM] = eeglab;

% Define the folder containing the .set files
data_folder = 'C:\Users\kiyonagalabadmin\Desktop\zv_data\data\data_set_files';

% Get a list of all .set files ending with _ref
set_files = dir(fullfile(data_folder, '*_ref.set'));

% Define the critical marker types
critical_markers = {'S  5', 'S  6', 'S  7', 'S  9', 'S 16', 'S 17', 'S 25', 'S 32', 'S 64', 'S 99'};

% Initialize a structure to store the counts of critical markers
marker_counts = struct();

% Loop through each file and apply the specified preprocessing steps
for i = 1:length(set_files)
    % Load the .set file
    filename = set_files(i).name;
    filepath = fullfile(data_folder, filename);
    EEG = pop_loadset('filename', filename, 'filepath', data_folder);
    [ALLEEG, EEG, CURRENTSET] = eeg_store(ALLEEG, EEG, 0);
    
    % Print all event types to debug
    disp(['Events in file: ', filename]);
    disp(unique({EEG.event.type}));
    
    % Extract original critical events
    original_critical_events = EEG.event(ismember({EEG.event.type}, critical_markers));
    original_critical_event_times = [original_critical_events.latency];
    
    % Print the number of critical markers before trimming
    disp(['Number of critical markers before trimming in file ', filename, ': ', num2str(length(original_critical_event_times))]);
    
    % Apply the 'Delete Time Segments' preprocessing step
    EEG = pop_erplabDeleteTimeSegments(EEG, ...
        'timeThresholdMS', 2000, ... % Time Threshold
        'startEventcodeBufferMS', 500, ... % Time prior to the first event code
        'endEventcodeBufferMS', 1500); % Time after the last event code
    
    % Extract trimmed critical events
    trimmed_critical_events = EEG.event(ismember({EEG.event.type}, critical_markers));
    trimmed_critical_event_times = [trimmed_critical_events.latency];
    
    % Print the number of critical markers after trimming
    disp(['Number of critical markers after trimming in file ', filename, ': ', num2str(length(trimmed_critical_event_times))]);
    
    % Check if all original critical events are still present in the trimmed data
    missing_events = setdiff(original_critical_event_times, trimmed_critical_event_times);
    if isempty(missing_events)
        disp(['No critical markers removed in file: ', filename]);
    else
        disp(['Critical markers removed in file: ', filename]);
        disp(['Missing event times: ', num2str(missing_events)]);
    end
    
    % Create a valid field name
    valid_fieldname = matlab.lang.makeValidName(filename);
    
    % Store the count of critical markers in the structure
    marker_counts.(valid_fieldname) = length(trimmed_critical_event_times);
    
    % Update the filename and save the new dataset
    new_filename = strrep(filename, '_ref.set', '_ref_trim.set');
    EEG = pop_saveset(EEG, 'filename', new_filename, 'filepath', data_folder);
    [ALLEEG, EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
end

% Check and display the count of critical markers for all files
disp('Critical marker counts for each file:');
disp(marker_counts);

% Compare the counts
unique_counts = unique(struct2array(marker_counts));
if length(unique_counts) == 1
    disp('All files have the same number of critical markers after trimming.');
else
    disp('Discrepancies found in the number of critical markers:');
    disp(unique_counts);
end

disp('Processing complete.');
