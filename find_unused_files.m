function find_unused_files(gateway_fcn)
% FIND_UNUSED_FILES gateway_fcn
%   gateway_fcn is a char with the function name.
%
% FIND_UNUSED_FILES checks all files in the same directory as the 
% gateway_fcn, including subdirectories. It then prints a list of files
% that are not called by the gateway function.
%
% Example: find_unused_files('foo') will call the function foo and print a
% list of files that are not called by the foo function.
%
% Hannes Mogensen, Lund University
    if ~ischar(gateway_fcn)
      error('Input function must be a char array')
    end
    
    search_path = which(gateway_fcn);
    top_dir = fileparts(search_path);
    
    dependent_files = matlab.codetools.requiredFilesAndProducts(gateway_fcn);
    all_files = dir([top_dir filesep '**' filesep '*.m']);
    
    all_files = struct2cell(all_files);
    all_files = string(all_files(1,:));
    for k = 1:numel(dependent_files)
        [~,name,ext] = fileparts(string(dependent_files{k}));
        depFile = strcat(name, ext);
        if ismember(depFile,all_files)
            idx = find(strcmp(all_files,depFile));
            all_files(idx) = [];
        end
    end
            
    uncalledFiles = all_files'
end