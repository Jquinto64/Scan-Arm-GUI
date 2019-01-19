function position=ReadPosition(Motor)

% Timeout for command
TimeOut = 1000;

% Clear the Buffer, if there is anything in it
if Motor.BytesAvailable
    fscanf(Motor,'%VelMotor',Motor.BytesAvailable);
end

%%%%%%%%%%% Poll the VelMex Motor Controller for 'X' position %%%%%%%%%%%%%
fprintf(Motor,'X');
i = 0; % Time-out object
while Motor.BytesAvailable ~= 9 % full position has 9 bytes
    i = i+1; %increment timeout
    if i > TimeOut
        flushinput(Motor); % Clear result of previous command
        fprintf(Motor,'X'); % Try command again
        i = 0; % Reset counter
    end
end
% Read the 'X' position from the buffer 
position.x = fscanf(Motor,'%VelMotor',Motor.BytesAvailable);

%%%%%%%%%%% Poll the VelMex Motor Controller for 'Y' position %%%%%%%%%%%%%
fprintf(Motor,'Y');
i = 0; % Time-out object
while Motor.BytesAvailable ~= 9 % full position has 9 bytes
    i = i+1; %increment timeout
    if i > TimeOut
        flushinput(Motor); % Clear result of previous command
        fprintf(Motor,'Y'); % Try command again
        i = 0; % Reset counter
    end
end
% Read the 'Y' position from the buffer 
position.y = fscanf(Motor,'%VelMotor',Motor.BytesAvailable);

%%%%%%%%%%% Poll the VelMex Motor Controller for 'Z' position %%%%%%%%%%%%%
fprintf(Motor,'Z');
i = 0; % Time-out object
while Motor.BytesAvailable ~= 9 % full position has 9 bytes
    i = i+1; %increment timeout
    if i > TimeOut
        flushinput(Motor); % Clear result of previous command
        fprintf(Motor,'Y'); % Try command again
        i = 0; % Reset counter
    end
end
% Read the 'Z' position from the buffer 
position.z = fscanf(Motor,'%VelMotor',Motor.BytesAvailable);

fprintf(['x: ' position.x, 'y: ' position.y, 'z: ' position.z '\n']);
end