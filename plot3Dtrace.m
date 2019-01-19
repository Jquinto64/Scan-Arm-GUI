function plot3Dtrace(Position,Data,ScanProp)

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
        axis1 = x;
        axis1title = 'x axis [mm]';
    case 2
        axis1 = y;
        axis1title = 'y axis [mm]';
    case 3 
        axis1 = z;
        axis1title = 'z axis [mm]';
    otherwise
        error('Selected Motor does not exist');
end

% Determine which motor is motor 2 for plotting purposes
switch ScanProp.M2
    case 1
        axis2 = x;
        axis2title = 'x axis [mm]';
    case 2
        axis2 = y;
        axis2title = 'y axis [mm]';
    case 3 
        axis2 = z;
        axis2title = 'z axis [mm]';
    otherwise
        error('Selected Motor does not exist');
end

% Determine which motor is motor 2 for plotting purposes
switch ScanProp.M3
    case 1
        axis3 = x;
        axis3title = 'x axis [mm]';
    case 2
        axis3 = y;
        axis3title = 'y axis [mm]';
    case 3 
        axis3 = z;
        axis3title = 'z axis [mm]';
    otherwise
        error('Selected Motor does not exist');
end


% Display the path taken by the scan arm
if plotpath == 1
    figure;
    plot3(axis1,axis2,axis3,'b+-');
    xlabel(axis1title);
    ylabel(axis2title);
    zlabel(axis3title);
    xlim([1.1*min(axis1) 1.1*max(axis1)]);
    ylim([1.1*min(axis2) 1.1*max(axis2)]);
    zlim([1.1*min(axis3) 1.1*max(axis3)]);
    view([10 60]);
end

% Display the data recorded from the oscilloscope
numstepsAxis1 = 1 + ceil((ScanProp.F1-ScanProp.S1)/ScanProp.del1);
numstepsAxis2 = 1 + ceil((ScanProp.F2-ScanProp.S2)/ScanProp.del2);
numstepsAxis3 = 1 + ceil((ScanProp.F3-ScanProp.S3)/ScanProp.del3);

for sliceNum = 1:numstepsAxis3
    figure;daspect([1 1 1]);
    cdata = zeros([numstepsAxis1*numstepsAxis2, 1]);
    for i = 1:length(Data)
        cdata(i) = Data((sliceNum-1)*numstepsAxis1*numstepsAxis2 + i).Max;
    end
    imagesc(axis1, axis2, reshape(cdata, numstepsAxis1,[]));
    colormap(jet(256));
    xlabel(axis1title);
    ylabel(axis2title);
    h = colorbar;
    ylabel(h, 'Peak-Peak [V]')
end
end
