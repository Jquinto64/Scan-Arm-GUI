function plot1Dtrace(Position,Data,ScanProp)
% Choose whether to plot the path or not (if 1, then plotted)
plotpath = 1; 

% Motor single step size is 0.00635mm
motorStep = 0.00635;

%% Transform the position data from string (motor position) to double [mm]
x = zeros([length(Position), 1]);
y = zeros([length(Position), 1]);
z = zeros([length(Position), 1]);
for i = 1:length(Position)
    x(i) = str2double(Position(i).x)*motorStep;
    y(i) = str2double(Position(i).y)*motorStep;
    z(i) = str2double(Position(i).z)*motorStep;
end

%% Generalize the function to plot any combination of x,y,z motors.
switch ScanProp.M %Which is the first motor axis?
    case 1
        axis = x;
        yaxistitle = 'x axis [mm]';
        xaxistitle = 'x steps';
    case 2
        axis = y;
        yaxistitle = 'y axis [mm]';
        xaxistitle = 'y steps';
    case 3 
        axis = z;
        yaxistitle = 'z axis [mm]';
        xaxistitle = 'z steps';
    otherwise
        error('Selected Motor does not exist');
end


%% Plot the scan arm path if plotpath is 1
if plotpath == 1
    figure;
    plot(axis,'b+-');
    xlabel(xaxistitle);
    ylabel(yaxistitle);
    %xlim([1.1*min(axis) 1.1*max(axis)]);
end

%% Display the data recorded from the oscilloscope
figure;daspect([1 1 1]);
cdata = zeros([length(Data), 1]);
for i = 1:length(Data)
    cdata(i) = Data(i).Max - Data(i).Min;
    %cdata(i) = Data(i).Min;
%     [MaxList, MinList] = GetPeaks(Data(i).Waveform,600);
%     cdata(i) = prctile(MaxList,90) - prctile(MinList,10);
end
plot(axis, cdata);
xlabel(yaxistitle);
ylabel('Peak-Peak [V]'); 
end