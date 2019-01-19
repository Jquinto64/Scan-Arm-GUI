function updatePosition(handles)
global s

%pause(0.5)
if s.BytesAvailable
    fscanf(s,'%s',s.BytesAvailable); % dump current buffer
end

% fprintf(s,'X')
% 
% while ~s.BytesAvailable
%    %wait while nothing ready 
% end

%waitForCompletion()
%fscanf(s,'%s',s.BytesAvailable); % dump current buffer

fprintf(s,'X');
% while ~s.BytesAvailable
%    %wait while nothing ready 
% end
% waitForCompletion()
while ~s.BytesAvailable || s.BytesAvailable < 9
   %wait while nothing ready 
end
output = fscanf(s,'%s',s.BytesAvailable);
xPos = output(max(end-7,1):end);

% if s.BytesAvailable
%     fscanf(s,'%s',s.BytesAvailable); % dump current buffer
% end
fprintf(s,'Y');
% while ~s.BytesAvailable
%    %wait while nothing ready 
% end
% waitForCompletion()
while ~s.BytesAvailable || s.BytesAvailable < 9
   %wait while nothing ready 
end
output = fscanf(s,'%s',s.BytesAvailable);
yPos = output(max(end-7,1):end);

% if s.BytesAvailable
%     fscanf(s,'%s',s.BytesAvailable); % dump current buffer
% end
%pause(1)
fprintf(s,'Z');
% while ~s.BytesAvailable
%    %wait while nothing ready 
% end
% waitForCompletion()
zTimer = tic;
while ~s.BytesAvailable || s.BytesAvailable < 9
   %wait while nothing ready 
   if toc(zTimer)>1
       fprintf(s,'Z');
       zTimer = tic;
   end
end
output = fscanf(s,'%s',s.BytesAvailable);

zPos = output(max(end-7,1):end);


set(handles.textXPos,'String',['X: ' xPos])
set(handles.textYPos,'String',['Y: ' yPos])
set(handles.textZPos,'String',['Z: ' zPos])

end