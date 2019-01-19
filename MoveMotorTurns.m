function MoveMotorTurns(Motor,motor,turns)
global s
M=s;

if turns ~= 0 && ~isnan(turns) % Don't run command if move distance is zero
    
    % Make sure motor is ready
    IsReady(M);
    
    % Move the correct motor the correct number of
    switch motor
        case 'x'
            cmd = (['F,C,I1M' num2str(turns) ',R']);
            fprintf(Motor,cmd);
            fprintf('Moved x motor %i turns \n',  turns);
        case 'y'
            cmd = (['F,C,I2M' num2str(turns) ',R']);
            fprintf(Motor,cmd);
            fprintf('Moved y motor %i turns \n',  turns);
        case 'z'
            cmd = (['F,C,I3M' num2str(turns) ',R']);
            fprintf(Motor,cmd);
            fprintf('Moved z motor %i turns \n',  turns);
        otherwise
            error('Motor Selected does not exist');
    end
    % Wait until the command has finished running
    while ~Motor.BytesAvailable
          % waiting ...%
    end

end
end