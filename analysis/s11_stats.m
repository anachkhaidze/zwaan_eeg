% Initialize EEGLAB
[ALLEEG, EEG, CURRENTSET, ALLCOM] = eeglab;

% Define the folder containing the .erp files
data_folder = 'C:\Users\kiyonagalabadmin\Desktop\zv_data\data\data_set_files\channel_subset';

% Get a list of all .erp files ending with _synctrej
erp_files = dir(fullfile(data_folder, '*.erp'));

% Define the bins and electrodes of interest
bins_of_interest = [8, 9, 10];
electrodes_of_interest = {'Cz', 'C1', 'C2', 'C3', 'C4', 'Pz', 'P1', 'P2', 'P3', 'P4', 'CPz', 'CP1', 'CP2', 'channel_cluster'};

% Initialize a cell array to store the data
data = {};

% Loop through each ERP file and extract the required information
for i = 1:length(erp_files)
    try
        % Load the .erp file
        filename = erp_files(i).name;
        filepath = fullfile(data_folder, filename);
        fprintf('Processing file: %s\n', filename);
        ERP = pop_loaderp('filename', filename, 'filepath', data_folder);
        
        % Extract subject ID
        subject_id = filename(1:6); % Assuming the first 6 characters represent the subject ID
        
        % Check if the ERP structure contains the necessary data
        if isempty(ERP.bindata)
            fprintf('No data in ERP file: %s\n', filename);
            continue;
        end
        
        % Loop through each bin and electrode of interest
        for bin = bins_of_interest
            for electrode = electrodes_of_interest
                % Get the electrode index
                electrode_idx = find(strcmpi({ERP.chanlocs.labels}, electrode));
                
                % Ensure the electrode index is valid
                if isempty(electrode_idx)
                    fprintf('Electrode %s not found in file: %s\n', electrode, filename);
                    continue;
                end
                
                % Extract data for each latency window
                latencies = [300, 400; 400, 500; 500, 600];
                for j = 1:size(latencies, 1)
                    start_latency = latencies(j, 1);
                    end_latency = latencies(j, 2);
                    
                    % Find the time indices for the latency window
                    time_indices = find(ERP.times >= start_latency & ERP.times <= end_latency);
                    
                    % Ensure time indices are valid
                    if isempty(time_indices)
                        fprintf('No data for latency window %d-%d ms in file: %s\n', start_latency, end_latency, filename);
                        continue;
                    end
                    
                    % Calculate mean amplitude and standard error
                    mean_amplitude = mean(mean(ERP.bindata(electrode_idx, time_indices, bin), 2), 3);
                    standard_error = std(mean(ERP.bindata(electrode_idx, time_indices, bin), 2), 0, 3) / sqrt(length(time_indices));
                    
                    % Calculate peak amplitude and standard error
                    peak_amplitude = max(mean(ERP.bindata(electrode_idx, time_indices, bin), 2), [], 3);
                    peak_standard_error = std(max(ERP.bindata(electrode_idx, time_indices, bin), [], 2), 0, 3) / sqrt(length(time_indices));
                    
                    % Store the data
                    data{end+1, 1} = subject_id;
                    data{end+1, 2} = electrode;
                    data{end+1, 3} = bin;
                    
                    % Store mean amplitude and standard error
                    if j == 1
                        data{end, 4} = mean_amplitude;
                        data{end, 5} = standard_error;
                    elseif j == 2
                        data{end, 6} = mean_amplitude;
                        data{end, 7} = standard_error;
                    else
                        data{end, 8} = mean_amplitude;
                        data{end, 9} = standard_error;
                    end
                    
                    % Store peak amplitude and standard error
                    if j == 1
                        data{end, 10} = peak_amplitude;
                        data{end, 11} = peak_standard_error;
                    elseif j == 2
                        data{end, 12} = peak_amplitude;
                        data{end, 13} = peak_standard_error;
                    else
                        data{end, 14} = peak_amplitude;
                        data{end, 15} = peak_standard_error;
                    end
                end
            end
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

% Check if data is not empty before converting to table
if ~isempty(data)
    % Convert the cell array to a table
    data_table = cell2table(data, 'VariableNames', {'SubjectID', 'Electrode', 'Bin', ...
        'MeanAmplitude_300_400', 'MeanAmplitude_300_400_SE', ...
        'MeanAmplitude_400_500', 'MeanAmplitude_400_500_SE', ...
        'MeanAmplitude_500_600', 'MeanAmplitude_500_600_SE', ...
        'PeakAmplitude_300_400', 'PeakAmplitude_300_400_SE', ...
        'PeakAmplitude_400_500', 'PeakAmplitude_400_500_SE', ...
        'PeakAmplitude_500_600', 'PeakAmplitude_500_600_SE'});

    % Display the table
    disp(data_table);

    % Save the table to a CSV file
    output_filepath = fullfile(data_folder, 'erp_data.csv');
    writetable(data_table, output_filepath);

    disp('Data extraction complete.');
else
    disp('No data extracted.');
end
