
function plot2Dtrace(Position, Data, ScanProp)
% Choose whether to plot the path or not
plotpath = 1; 

% Motor single step size is 0.00635mm
motorStep = 0.00635;

% Transform the position data from string (motor position) to double [mm]
x = zeros([length(Position), 1]);
y = zeros([length(Position), 1]);
z = zeros([length(Position), 1]);
for i = 1:length(Position)
    x(i) = str2double(Position(i).x)*motorStep;
    y(i) = str2double(Position(i).y)*motorStep;
    z(i) = str2double(Position(i).z)*motorStep;
end

% Generalize the function to plot any combination of x,y,z motors.
switch ScanProp.M1 %Which is the first motor axis?
    case 1
        axis1title = 'x axis [mm]';
        d1 = min(x(x~=min(x)))-min(x);
        v1 = min(x):d1:max(x);
        Position1 = x;
    case 2
        axis1title = 'y axis [mm]';
        d1 = min(y(y~=min(y)))-min(y);
        v1 = min(y):d1:max(y);
        Position1 = y;
    case 3 
        axis1title = 'z axis [mm]';
        d1 = min(z(z~=min(z)))-min(z);
        v1 = min(z):d1:max(z);
        Position1 = z;
    otherwise
        error('Selected Motor does not exist');
end

% Determine which motor is motor 2 for plotting purposes
switch ScanProp.M2
    case 1
        axis2title = 'x axis [mm]';
        d2 = min(x(x~=min(x)))-min(x);
        v2 = min(x):d2:max(x);
        Position2 = x;
    case 2
        axis2title = 'y axis [mm]';
        d2 = min(y(y~=min(y)))-min(y);
        v2 = min(y):d2:max(y);
        Position2 = y;
    case 3 
        axis2title = 'z axis [mm]';
        d2 = min(z(z~=min(z)))-min(z);
        v2 = min(z):d2:max(z);
        Position2 = z;
    otherwise
        error('Selected Motor does not exist');
end

% Display the path taken by the scan arm
if plotpath == 1
    figure;
    plot(Position1,Position2,'b+-');
    xlabel(axis1title);
    ylabel(axis2title);
    xlim([1.1*min(Position1) 1.1*max(Position1)]);
    ylim([1.1*min(Position2) 1.1*max(Position2)]);
end

% Display the data recorded from the oscilloscope
figure;daspect([1 1 1]);
EXP = zeros([length(v1) length(v2)]);
for i = 1:length(Data)
     %xpos = floor((Position1(i) - v1(1))/d1 + 1);
     %ypos = floor((Position2(i) - v2(1))/d2 + 1);
     xpos = round((Position1(i) - v1(1))/d1 + 1);
     ypos = round((Position2(i) - v2(1))/d2 + 1);
    EXP(xpos,ypos) = Data(i).Max - Data(i).Min;
%     [MaxList, MinList] = GetPeaks(Data(i).Waveform,275);
%     EXP(xpos,ypos) = prctile(MaxList,90) - prctile(MinList,90);
    
end

imagesc(v1,v2,EXP);
colormap(jet(256));
xlim([min(v1) max(v1)]);
ylim([min(v2) max(v2)]);
xlabel(axis2title);
ylabel(axis1title);
h = colorbar;
ylabel(h, 'Peak-Peak [V]')
end