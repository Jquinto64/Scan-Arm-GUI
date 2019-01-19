% Non-functional; feature not useful enough to fix

function updateScanPoints(handles)
    xStart = str2num(get(handles.editXStart,'String'));
    xStop = str2num(get(handles.editXStop,'String'));
    xStep = str2num(get(handles.editXStep,'String'));
    yStart = str2num(get(handles.editYStart,'String'));
    yStop = str2num(get(handles.editYStop,'String'));
    yStep = str2num(get(handles.editYStep,'String'));
    zStart = str2num(get(handles.editZStart,'String'));
    zStop = str2num(get(handles.editZStop,'String'));
    zStep = str2num(get(handles.editZStep,'String'));
    
    numPoints = ((xStop-xStart)/xStep+1)*((yStop-yStart)/yStep+1)*((zStop-zStart)/zStep+1);
    set(handles.textNumberOfScanPoints,'String',['Number of Scan Points: ' num2str(numPoints)])
end