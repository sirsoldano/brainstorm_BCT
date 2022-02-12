% Ver2.0 (01-Dec-2021)
SubjectNames = {'01','02'};   % replace 01,02, ... to proper subject names

% --------------- modify above variables ------------------

tag = 'epoch'

% Start a new report
sFiles = {};
bst_report('Start', sFiles);
N = numel(SubjectNames);
for I = 1:N
sFiles = bst_process('CallProcess', 'process_select_files_data', sFiles, [], ...
'subjectname',   SubjectNames{I}, ...
'condition',     '', ...
'tag',           tag, ...
'includebad',    0, ...
'includeintra',  0, ...
'includecommon', 0);
% Process: Delete folders
sFiles = bst_process('CallProcess', 'process_delete', sFiles, [], ...
    'target', 2);  % Delete folders
end

% Save and display report
ReportFile = bst_report('Save', sFiles);
bst_report('Open', ReportFile);
% bst_report('Export', ReportFile, ExportDir);

clearvars
