function [Data,Position,ScopeSettings]=RasterScan(VelMotor,myScope,Prop,CH,Home)
%% Generate VelMex Command based on 'ScanType' 
switch Prop.ScanType
    case '1D'       
        
   % Motor single step size is 0.00635mm
motorStep = 0.00635; %[mm]

% Stepping variables: Motor steps to start of scan location
MoveToStart = floor(abs(Prop.S/motorStep));

% Stepping variables: Motor steps per scan step
Step = floor(abs(Prop.del)/motorStep);

% Be careful with signs
if Prop.S < 0; MoveToStart = - MoveToStart; end;
if Prop.del < 0; Step = - Step; end;

% Be careful with step direction
if (Step > 0) && Prop.F < Prop.S; error('Bad Motor input'); end;  
if (Step < 0) && Prop.F > Prop.S; error('Bad Motor input'); end;  

% Stepping variables: Number of scan steps (loop index starts at 1)
%NumSteps = 1 + ceil((ScanProp.F-ScanProp.S)/ScanProp.del);
numSteps = 1 + floor((Prop.F-Prop.S)/(Step*motorStep));

% Send Motor to Starting position
if MoveToStart == 0
    cmd1 = 'C,';
else
    cmd1 = ['C,I',num2str(Prop.M), 'M', num2str(MoveToStart), ','];
end

% Concatenate Motor commands, add wait for 'G' and set loop to mark for scan
cmd = [cmd1 'LM0,'];

% Concatenate the scanning command together, add the Motor 1 Step
cmdScan = ['U6,I',num2str(Prop.M), 'M', num2str(Step),','];
% Add the Number of Motor 1 steps
cmdScan = [cmdScan, 'L', num2str(numSteps), ','];

% Concatenate commands together
cmd = [cmd cmdScan];

% Print command to motor controllers

fprintf(VelMotor,cmd);

    case '2D'
% Motor single step size is 0.00635mm
motorStep = 0.00635; %[mm]

% Start counter for number of steps in the scan
numSteps = 0;

% Stepping variables: Motor steps to start of scan location
MoveToStart1 = floor(abs(Prop.S1/motorStep));
MoveToStart2 = floor(abs(Prop.S2/motorStep));

% Stepping variables: Motor steps per scan step
Step1 = floor(abs(Prop.del1)/motorStep);
Step2 = floor(abs(Prop.del2)/motorStep);

% Be careful with signs
if Prop.S1 < 0; MoveToStart1 = - MoveToStart1; end;
if Prop.S2 < 0; MoveToStart2 = - MoveToStart2; end;
if Prop.del1 < 0; Step1 = - Step1; end;
if Prop.del2 < 0; Step2 = - Step2; end;

% Be careful with step direction
if (Step1 > 0) && Prop.F1 < Prop.S1; error('Bad Motor 1 input'); end;  
if (Step2 > 0) && Prop.F2 < Prop.S2; error('Bad Motor 2 input'); end;  
if (Step1 < 0) && Prop.F1 > Prop.S1; error('Bad Motor 1 input'); end;  
if (Step2 < 0) && Prop.F2 > Prop.S2; error('Bad Motor 2 input'); end;  

% Stepping variables: Number of scan steps (loop index starts at 1)
NumSteps1 = 1 + floor((Prop.F1-Prop.S1)/(Step1*motorStep));
NumSteps2 = 1 + floor((Prop.F2-Prop.S2)/(Step2*motorStep));

% Stepping variables: Number of motor steps, return to start of motor 1 scan
Return1 = -(NumSteps1-1)*Step1;

% Send Motor 1 to Starting position
if MoveToStart1 == 0
    cmd1 = 'C,';
else
    cmd1 = ['C,I',num2str(Prop.M1), 'M', num2str(MoveToStart1), ','];
end
% Send Motor 2 to Starting position
if MoveToStart2 ~= 0
    cmd2 = ['I',num2str(Prop.M2), 'M', num2str(MoveToStart2), ','];
    % Concatenate Motor commands, add wait for 'G' and set loop to mark for scan
    cmd = [cmd1 cmd2 'LM0,'];
else
    cmd = [cmd1 'LM0,'];
end


% Concatenate the scanning command together, add the Motor 1 Step
cmdScan = ['U6,I',num2str(Prop.M1), 'M', num2str(Step1),','];
% Add the Number of Motor 1 steps
cmdScan = [cmdScan, 'L', num2str(NumSteps1), ','];
% Return first axis to start
cmdScan = [cmdScan, 'I',num2str(Prop.M1),'M',num2str(Return1), ','];
% Add the Motor 2 Step
cmdScan = [cmdScan, 'I',num2str(Prop.M2), 'M', num2str(Step2) ','];
% Add the Number of Motor 2 steps
cmdScan = [cmdScan, 'L', num2str(NumSteps2), ','];

% Add # Scan steps
numSteps = numSteps + NumSteps1*NumSteps2;

% Concatenate commands together
cmd = [cmd cmdScan];
    
% Print command to motor controllers
fprintf(VelMotor,cmd);
        
    case '3D'
% Motor single step size is 0.00635mm
motorStep = 0.00635; %[mm]

% Start counter for number of steps in the scan
numSteps = 0;

% Stepping variables: Motor steps to start of scan location
MoveToStart1 = floor(abs(Prop.S1/motorStep));
MoveToStart2 = floor(abs(Prop.S2/motorStep));
MoveToStart3 = floor(abs(Prop.S3/motorStep));

% Stepping variables: Motor steps per scan step
Step1 = floor(abs(Prop.del1)/motorStep);
Step2 = floor(abs(Prop.del2)/motorStep);
Step3 = floor(abs(Prop.del3)/motorStep);


% Be careful with signs
if Prop.S1 < 0; MoveToStart1 = - MoveToStart1; end;
if Prop.S2 < 0; MoveToStart2 = - MoveToStart2; end;
if Prop.S3 < 0; MoveToStart3 = - MoveToStart3; end;
if Prop.del1 < 0; Step1 = - Step1; end;
if Prop.del2 < 0; Step2 = - Step2; end;
if Prop.del3 < 0; Step3 = - Step3; end;


% Be careful with step direction
if (Step1 > 0) && Prop.F1 < Prop.S1; error('Bad Motor 1 input'); end;  
if (Step2 > 0) && Prop.F2 < Prop.S2; error('Bad Motor 2 input'); end;
if (Step3 > 0) && Prop.F3 < Prop.S3; error('Bad Motor 3 input'); end;  

if (Step1 < 0) && Prop.F1 > Prop.S1; error('Bad Motor 1 input'); end;  
if (Step2 < 0) && Prop.F2 > Prop.S2; error('Bad Motor 2 input'); end;
if (Step3 < 0) && Prop.F3 > Prop.S3; error('Bad Motor 3 input'); end;  


% Stepping variables: Number of scan steps (loop index starts at 1)
NumSteps1 = 1 + ceil((Prop.F1-Prop.S1)/(Step1*motorStep));
NumSteps2 = 1 + ceil((Prop.F2-Prop.S2)/(Step2*motorStep));
NumSteps3 = 1 + ceil((Prop.F3-Prop.S3)/(Step3*motorStep));


% Stepping variables: Number of motor steps, return to start of motor 1 scan
Return1 = -(NumSteps1-1)*Step1;
% return to start of motor 2 scan
Return2 = -(NumSteps2-1)*Step2;

% Send Motor 1 to Starting position
if MoveToStart1 == 0
    cmd1 = 'C,';
else
    cmd1 = ['C,I',num2str(Prop.M1), 'M', num2str(MoveToStart1), ','];
end
% Send Motor 2 to Starting position
if MoveToStart2 ~= 0
    cmd2 = ['I',num2str(Prop.M2), 'M', num2str(MoveToStart2), ','];
    % Concatenate Motor commands, add wait for 'G' and set loop to mark for scan
    cmd = [cmd1 cmd2];
else
    cmd = cmd1;
end

% Send Motor 3 to Starting position
if MoveToStart3 ~= 0
    cmd3 = ['I',num2str(Prop.M3), 'M', num2str(MoveToStart3), ','];
    % Concatenate Motor commands, add wait for 'G' and set loop to mark for scan
    cmd = [cmd cmd3 'LM0,'];
else
    cmd = [cmd 'LM0,'];
end

% Concatenate the scanning command together, add the Motor 1 Step
cmdScan = ['U6,I', num2str(Prop.M1), 'M', num2str(Step1), ','];
% Add the Number of Motor 1 steps
cmdScan = [cmdScan, 'L', num2str(NumSteps1), ','];
% Return first axis to start
cmdScan = [cmdScan, 'I', num2str(Prop.M1), 'M', num2str(Return1), ','];
% Add the Motor 2 Step
cmdScan = [cmdScan, 'I', num2str(Prop.M2), 'M', num2str(Step2), ','];
% Add the Number of Motor 2 steps
cmdScan = [cmdScan, 'L', num2str(NumSteps2), ','];
% Return the second axis to start
cmdScan = [cmdScan, 'I', num2str(Prop.M2), 'M', num2str(Return2), ','];
% Add the Motor 3 Step
cmdScan = [cmdScan, 'I', num2str(Prop.M3), 'M', num2str(Step3), ','];
% Add the Number of Motor 3 steps
cmdScan = [cmdScan, 'L', num2str(NumSteps3), ','];
    

% Add # Scan steps
numSteps = numSteps + NumSteps1*NumSteps2*NumSteps3;

% Concatenate commands together
cmd = [cmd cmdScan];
    
% Print command to motor controllers
fprintf(VelMotor,cmd);

end
%% Move motor to start of Scan
fprintf(VelMotor,'G,R,');
while ~VelMotor.BytesAvailable
          % waiting ...%
end

%% Get oscilloscope properties for the scan
switch CH
    case 1
        fprintf(myScope, 'DATa:SOUrce CH1');
        yProps = query(myScope,'CH1?');
        yProps = SeparateCharString(yProps,';');
    case 2
        fprintf(myScope, 'DATa:SOUrce CH2');
        yProps = query(myScope,'CH2?');
        yProps = SeparateCharString(yProps,';');
end

%% Get X properties from the scope 
global  deviceObj s Average PauseTime 
xProps = query(myScope,'HORizontal?');
xProps = SeparateCharString(xProps,';');
yOffset = str2double(yProps{14}); %Until I figure out how to get correct value
verticalScale = str2double(yProps{17}); % Same as above;
NPoints = str2double(xProps{4}); % Get the number of points in waveform

% wait for movement to start of scan
pause(2);

% Build Position Structure
Position = struct('x',cell([numSteps, 1]),'y',cell([numSteps, 1]),'z',cell([numSteps, 1]));

% Build Data structure
Data = struct('Max',[],'Mean',[],'Min',[],'Waveform',[]);

%% Start Scan     
for i = 1:numSteps
    
    % Read data from oscilloscope
    Scope=deviceObj;  
    Av=Average;
    Pause=PauseTime;
    Data(i) = ReadScope(Scope,verticalScale,yOffset,Av,NPoints,Pause);
    
    % Read the motor position
    Motor=s;
    Position(i) = ReadPosition(Motor);
    while isempty(Position(i).x)|| isempty(Position(i).y) ||isempty(Position(i).z)
        % waiting ...
    end
    
    % Move the motor to the next position
    fprintf(VelMotor,'G,R,');
    
    % Wait for Motor to be available
    while ~VelMotor.BytesAvailable
         % waiting ...
    end    
    
    %pause(1.5);
end

% Reset VelMex commands
fprintf(VelMotor,'K,F,C,setM1M4,setM2M4,setM3M5');

% Move motor back to starting position
pause(1.0);
if Home == 1
    Mtr=s;
    ReturnHome(Mtr);
end

ScopeSettings = struct('x',[],'y',[]);
ScopeSettings.x = xProps;
ScopeSettings.y = yProps;
end