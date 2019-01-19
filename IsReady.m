function IsReady(M)

% Clear the buffer, if it contains any data
if M.BytesAvailable
    fscanf(M,'%VelMotor',M.BytesAvailable);
end

% Send the check status command to the VelMex motor controller
fprintf(M,'V');

% Wait for reply
while ~M.BytesAvailable
    % Wait
end

% Read reply
state = fscanf(M,'%VelMotor',M.BytesAvailable);

% If reply isn't ready, then recursively call function. Not sure if this is
% the best option
if isempty(strfind(state,'R'))
    fprintf('VelMotor Returned Busy \n');
    IsReady(M);
end
end