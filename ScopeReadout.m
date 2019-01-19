function [Data, ScopeSettings] = ...
    ScopeReadout(dObj, Chan, Rt, Pt)
%% Get oscilloscope properties for the scan
switch Chan
    case 1
        fprintf(dObj, 'DATa:SOUrce CH1');
        yProps = query(dObj,'CH1?');
        yProps = SeparateCharString(yProps,';');
    case 2
        fprintf(dObj, 'DATa:SOUrce CH2');
        yProps = query(dObj,'CH2?');
        yProps = SeparateCharString(yProps,';');
    otherwise
        error('Channel Chosen is not in use \n');
end
%% Get X properties from the scope
xProps = query(dObj,'HORizontal?');
xProps = SeparateCharString(xProps,';');
yOffset = str2double(yProps{14}); %Until I figure out how to get correct value
verticalScale = str2double(yProps{17}); % Same as above;
NPoints = str2double(xProps{4}); % Get the number of points in waveform

% wait for movement to start of scan
pause(1);

% Build Scope Data structure
Data = struct('Max',[],'Mean',[],'Min',[],'Waveform',[]);

if round(Rt/Pt) < 1
    error('Record Time must equal or be greater than Pause Time')
end

%% Start Scan 
global deviceObj Average PauseTime 
for i = 1:round(Rt/Pt)
    % Read data from oscilloscope
    Scope=deviceObj;  
    Av=Average;
    Pause=PauseTime;
    Data(i) = ReadScope(Scope,verticalScale,yOffset,Av,NPoints,Pause);
    
end

ScopeSettings = struct('x',[],'y',[]);
ScopeSettings.x = xProps;
ScopeSettings.y = yProps;
end