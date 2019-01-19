function toggleStates(handles)
switch get(get(handles.uibuttongroupScanAxes,'SelectedObject'),'String')
    case 'X'
%         if strcmp(get(get(handles.uibuttongroupUnits,'SelectedObject'),'String'),'Steps')
%             toggleScan(handles,'X',true)
%         else
%             toggleScan(handles,'X',false)
%         end
        toggleScan(handles,'X',strcmp(get(get(handles.uibuttongroupUnits,'SelectedObject'),'String'),'Steps'))
    case 'Y'
        toggleScan(handles,'Y',strcmp(get(get(handles.uibuttongroupUnits,'SelectedObject'),'String'),'Steps'))
    case 'Z'
        toggleScan(handles,'Z',strcmp(get(get(handles.uibuttongroupUnits,'SelectedObject'),'String'),'Steps'))
    case 'XY'
        toggleScan(handles,'XY',strcmp(get(get(handles.uibuttongroupUnits,'SelectedObject'),'String'),'Steps'))
    case 'XZ'
        toggleScan(handles,'XZ',strcmp(get(get(handles.uibuttongroupUnits,'SelectedObject'),'String'),'Steps'))
    case 'YZ'
        toggleScan(handles,'YZ',strcmp(get(get(handles.uibuttongroupUnits,'SelectedObject'),'String'),'Steps'))
    case 'XYZ'
        toggleScan(handles,'XYZ',strcmp(get(get(handles.uibuttongroupUnits,'SelectedObject'),'String'),'Steps'))
end
end