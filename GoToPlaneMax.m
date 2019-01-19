function GoToPlaneMax(dt,ps) 
global s

% Turn Data and Position into a more useable format
for i = 1:length(ps)
    x(i) = str2double(ps(i).x);
    y(i) = str2double(ps(i).y);
    z(i) = str2double(ps(i).z);
    %[MaxList, ~] = GetPeaks(Data(i).Waveform,280);
    Signal(i) = dt(i).Max; 
    %Signal(i) = prctile(MaxList,90);
end

% Get the maximum and the index of the maximum
[M, I] = max(Signal(:));

% The Motor positions of the maximum are given by I. Move the Motors to the
% position of the maximum. 
Motor=s;
MoveMotorTurns(Motor,'x',x(I));
MoveMotorTurns(Motor,'y',y(I));
MoveMotorTurns(Motor,'z',z(I));

fprintf('Moved to plane maximum \n');