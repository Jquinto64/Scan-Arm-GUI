function VelMotor = OpenMotor
% OPENMOTOR: A function used to connect to the VelMex Motor controllers of
% the positioning system. All properties (port, baudrate, etc.) are already
% included within this function.
% OUPUTS:
%       VelMotor : Motor object for communication with the VelMex Motors

if exist('VelMotor','var')
    fprintf('VelMotor Object already exists \n');
else
    %% Open VelMex motor 
    VelMotor = serial('COM4','BaudRate',9600,'DataBits',8,'Parity','None','StopBits',1);
    
    if strcmp(VelMotor.Status,'closed')
        
        fopen(VelMotor);
        %Set properties
        fprintf(VelMotor,'F,C,setM1M4,setM2M4,setM3M5');
        
        if strcmp(VelMotor.Status,'open')
            fprintf('VelMex Motor Opened Successfully \n');
        else
            error('VelMex Motor Unopened \n');
        end
    end
    
    
end

%% dump current buffer, if it exists
if VelMotor.BytesAvailable
      fscanf(VelMotor,'%VelMotor',VelMotor.BytesAvailable)
end

end
