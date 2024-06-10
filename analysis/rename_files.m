% Define the folder path
folderPath = 'C:\Users\kiyonagalabadmin\Desktop\zv_data\data\data_set_files\ica_1hz';

% Get a list of all .set files in the folder
filePattern = fullfile(folderPath, '*.set');
setFiles = dir(filePattern);

% Loop through each file and rename it
for k = 1:length(setFiles)
    % Get the full file name
    baseFileName = setFiles(k).name;
    fullFileName = fullfile(folderPath, baseFileName);
    
    % Generate the new file name with _1hz appended
    [pathStr, name, ext] = fileparts(fullFileName);
    
    % Check if the file already ends with _1hz
    if endsWith(name, '_1hz')
        continue;
    end
    
    newSetFileName = fullfile(pathStr, [name '_1hz' ext]);
    
    % Rename the .set file
    movefile(fullFileName, newSetFileName);
    
    % Check if the accompanying .fdt file exists
    fdtFileName = fullfile(pathStr, [name '.fdt']);
    if isfile(fdtFileName)
        newFdtFileName = fullfile(pathStr, [name '_1hz.fdt']);
        % Rename the .fdt file
        movefile(fdtFileName, newFdtFileName);
    end
end

% Display a message indicating the process is complete
disp('File renaming complete.');
