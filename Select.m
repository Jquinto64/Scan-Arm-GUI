function Select(handles)
global Channel 
switch get(get(handles.uibuttongroupChannel,'SelectedObject'),'String')
    case 'Channel 1'
        Channel=1;
        set(handles.textCurrent,'String','Channel 1 Selected')
    case 'Channel 2'
        Channel=2;
        set(handles.textCurrent,'String','Channel 2 Selected')
        
if isempty(get(get(handles.uibuttongroupChannel,'SelectedObject'),'String'))
     Channel=2;
end
 
end
end