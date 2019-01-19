function ReturnHome(Mtr)
global s
Motor=s;
% Clear previous commands from controllers
fprintf(Mtr,'F,C');

% Clear the Buffer, if there is anything in it
if Mtr.BytesAvailable
    fscanf(Mtr,'%VelMotor',Mtr.BytesAvailable);
end

Position= ReadPosition(Motor);

%% Establish Steps for Home

XstepsHome = str2double(Position.x);
YstepsHome = str2double(Position.y);
ZstepsHome = str2double(Position.z);

%% Move Scan Arm to Home Position

% Move home in X direction
MoveMotorTurns(Motor, 'x', -XstepsHome);
% Move home in Y direction
MoveMotorTurns(Motor, 'y', -YstepsHome);
% Move home in Z direction
MoveMotorTurns(Motor, 'z', -ZstepsHome);

fprintf('Scan Arm returned to home \n');
end