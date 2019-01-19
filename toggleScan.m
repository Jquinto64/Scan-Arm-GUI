function toggleScan(handles, axes, isSteps)
% for i=1:length(axes) %doesnt work becasue 'Enable' must be 'On' or 'Off', 'true' and 'false' dont work
%     set(eval(['handles.edit' axes(i) 'Start']),'Enable',isSteps);
%     set(eval(['handles.edit' axes(i) 'Stop']),'Enable',isSteps);
%     set(eval(['handles.edit' axes(i) 'Step']),'Enable',isSteps);
%     set(eval(['handles.edit' axes(i) 'Startmm']),'Enable',~isSteps);
%     set(eval(['handles.edit' axes(i) 'Stopmm']),'Enable',~isSteps);
%     set(eval(['handles.edit' axes(i) 'Stepmm']),'Enable',~isSteps);
% end


if isSteps, stepOrMM = '';
else, stepOrMM = 'mm'; end
for i=1:length(axes)
    set(eval(['handles.edit' axes(i) 'Start' stepOrMM]),'Enable','On');
    set(eval(['handles.edit' axes(i) 'Stop' stepOrMM]),'Enable','On');
    set(eval(['handles.edit' axes(i) 'Step' stepOrMM]),'Enable','On');
end
if isSteps, stepOrMM = 'mm';
else, stepOrMM = ''; end
for i=1:length(axes)
    set(eval(['handles.edit' axes(i) 'Start' stepOrMM]),'Enable','Off');
    set(eval(['handles.edit' axes(i) 'Stop' stepOrMM]),'Enable','Off');
    set(eval(['handles.edit' axes(i) 'Step' stepOrMM]),'Enable','Off');
end

nonAxes = setdiff('XYZ',axes);
for i=1:length(nonAxes)
    set(eval(['handles.edit' nonAxes(i) 'Start']),'Enable','Off');
    set(eval(['handles.edit' nonAxes(i) 'Stop']),'Enable','Off');
    set(eval(['handles.edit' nonAxes(i) 'Step']),'Enable','Off');
    set(eval(['handles.edit' nonAxes(i) 'Startmm']),'Enable','Off');
    set(eval(['handles.edit' nonAxes(i) 'Stopmm']),'Enable','Off');
    set(eval(['handles.edit' nonAxes(i) 'Stepmm']),'Enable','Off');
end
end