function varargout = ScannerStage4__(varargin)
% ScannerStage4__ MATLAB code for ScannerStage4__.fig
%      ScannerStage4__, by itself, creates a new ScannerStage4__ or raises the existing
%      singleton*.
%
%      H = ScannerStage4__ returns the handle to a new ScannerStage4__ or the handle to
%      the existing singleton*.
%
%      ScannerStage4__('CALLBACK',hObject,eventData,handles,...) calls the local
% %      function named CALLBACK in ScannerStage4__.M with the given input arguments.
%
%      ScannerStage4__('Property','Value',...) creates a new ScannerStage4__ or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ScannerStage4___OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ScannerStage4___OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ScannerStage4__

% Last Modified by GUIDE v2.5 22-Aug-2018 09:57:57
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ScannerStage4___OpeningFcn, ...
                   'gui_OutputFcn',  @ScannerStage4___OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
      gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before ScannerStage4__ is made visible.
function ScannerStage4___OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ScannerStage4__ (see VARARGIN)

% Choose default command line output for ScannerStage4__
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ScannerStage4__ wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = ScannerStage4___OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in pushbuttonStepXPos.
function pushbuttonStepXPos_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonStepXPos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s
stepSize = get(handles.editJogDistance,'String');
fprintf(s,['F,C,I1M' stepSize ',R'])
%waitForCompletion()
while ~s.BytesAvailable
   %wait while nothing ready 
end
updatePosition(handles)

% --- Executes on button press in pushbuttonStepXNeg.
function pushbuttonStepXNeg_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonStepXNeg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s
stepSize = get(handles.editJogDistance,'String');
fprintf(s,['F,C,I1M-' stepSize ',R'])
%waitForCompletion()
while ~s.BytesAvailable
   %wait while nothing ready 
end
updatePosition(handles)


% --- Executes on button press in pushbuttonStepYPos.
function pushbuttonStepYPos_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonStepYPos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s
stepSize = get(handles.editJogDistance,'String');
fprintf(s,['F,C,I2M' stepSize ',R'])
%waitForCompletion()
while ~s.BytesAvailable
   %wait while nothing ready 
end
tic
updatePosition(handles)
toc

% --- Executes on button press in pushbuttonStepYNeg.
function pushbuttonStepYNeg_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonStepYNeg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s
stepSize = get(handles.editJogDistance,'String');
fprintf(s,['F,C,I2M-' stepSize ',R'])
% waitForCompletion()
while ~s.BytesAvailable
   %wait while nothing ready 
end
updatePosition(handles)

% --- Executes on button press in pushbuttonStepZPos.
function pushbuttonStepZPos_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonStepZPos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s
stepSize = get(handles.editJogDistance,'String');
fprintf(s,['F,C,I3M' stepSize ',R'])
% waitForCompletion()
while ~s.BytesAvailable
   %wait while nothing ready 
end
updatePosition(handles)

% --- Executes on button press in pushbuttonStepZNeg.
function pushbuttonStepZNeg_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonStepZNeg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s
stepSize = get(handles.editJogDistance,'String');
fprintf(s,['F,C,I3M-' stepSize ',R'])
% waitForCompletion()
while ~s.BytesAvailable
   %wait while nothing ready 
end
updatePosition(handles)

function editJogDistance_Callback(hObject, eventdata, handles)
% hObject    handle to editJogDistance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editJogDistance as text
%        str2double(get(hObject,'String')) returns contents of editJogDistance as a double


% --- Executes during object creation, after setting all properties.
function editJogDistance_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editJogDistance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in pushbuttonConnect.
function pushbuttonConnect_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonConnect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s
s = OpenMotor;
set(handles.textStatus,'String','Status: Connected')
pause(0.4)
updatePosition(handles)
set(handles.textCurrent,'String','Motors Ready')

% --- Executes on button press in pushbuttonDisconnect.
function pushbuttonDisconnect_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonDisconnect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s
fprintf(s,'K,Q');
fclose(s)
delete(s)
clear s

set(handles.textStatus,'String','Status: Disconnected')
set(handles.textCurrent,'String','Motors Off')

function pushbuttonRasterScan_Callback(hObject, eventdata, handles)
% Saves and shows xyz positions & average waveform data at every point 
% Detects sample size and record length 

% hObject    handle to pushbuttonRasterScan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s deviceObj ScanProp Channel RasterReturnHome Data Position ScopeSettings
warning('off','all');

xStart = str2num(get(handles.editXStartmm,'String'));
xStop = str2num(get(handles.editXStopmm,'String'));
xStep = str2num(get(handles.editXStepmm,'String'));
yStart = str2num(get(handles.editYStartmm,'String'));
yStop = str2num(get(handles.editYStopmm,'String'));
yStep = str2num(get(handles.editYStepmm,'String'));
zStart = str2num(get(handles.editZStartmm,'String'));
zStop = str2num(get(handles.editZStopmm,'String'));
zStep = str2num(get(handles.editZStepmm,'String'));

switch get(get(handles.uibuttongroupScanAxes,'SelectedObject'),'String')
    case 'X' 
        ScanProp = struct('M',1,'S',xStart,'del',xStep,'F',xStop,'ScanType','1D');
    case 'Y'
        ScanProp = struct('M',2,'S',yStart,'del',yStep,'F',yStop,'ScanType','1D');
    case 'Z'
        ScanProp = struct('M',3,'S',zStart,'del',zStep,'F',zStop,'ScanType','1D');
    case 'XY'
        ScanProp = struct('M1',1,'S1',xStart,'del1',xStep,'F1',xStop,...
       'M2',2,'S2',yStart,'del2',yStep,'F2',yStop,...
       'ScanType','2D');
    case 'XZ'
        ScanProp = struct('M1',1,'S1',xStart,'del1',xStep,'F1',xStop,...
       'M2',3,'S2',zStart,'del2',zStep,'F2',zStop,...
       'ScanType','2D');
    case 'YZ'
        ScanProp = struct('M1',2,'S1',yStart,'del1',yStep,'F1',yStop,...
       'M2',3,'S2',zStart,'del2',zStep,'F2',zStop,...
       'ScanType','2D');
    case 'XYZ'
        ScanProp = struct('M1',1,'S1',xStart,'del1',xStep,'F1',xStop,...
       'M2',2,'S2',yStart,'del2',yStep,'F2',yStop,...
       'M3',3,'S3',zStart,'del3',zStep,'F3',zStop,...
       'ScanType','3D');
end
%% Raster Scan
VelMotor=s;
myScope=deviceObj;
Prop=ScanProp;
CH=Channel;
Home=RasterReturnHome;
set(handles.textCurrent,'String','Conducting Raster Scan')
    [Data, Position, ScopeSettings]= RasterScan(VelMotor,myScope,Prop,CH,Home);
set(handles.textCurrent,'String','Raster Scan Complete')

%% Switch function based on scan type
switch ScanProp.ScanType
    case '1D'
        plot1Dtrace(Position, Data, ScanProp);
    case '2D'
        plot2Dtrace(Position, Data, ScanProp);
    case '3D'
        plot3Dtrace(Position, Data, ScanProp);
end
set(handles.textCurrent,'String','Plotting Raster Scan Data')

function editXStart_Callback(hObject, eventdata, handles)
% hObject    handle to editXStart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editXStart as text
%        str2double(get(hObject,'String')) returns contents of editXStart as a double
set(handles.editXStartmm,'String',num2str(str2num(get(hObject,'String'))/157.480315))


% --- Executes during object creation, after setting all properties.
function editXStart_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editXStart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editXStop_Callback(hObject, eventdata, handles)
% hObject    handle to editXStop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editXStop as text
%        str2double(get(hObject,'String')) returns contents of editXStop as a double

set(handles.editXStopmm,'String',num2str(str2num(get(hObject,'String'))/157.480315))

% --- Executes during object creation, after setting all properties.
function editXStop_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editXStop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editXStep_Callback(hObject, eventdata, handles)
% hObject    handle to editXStep (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editXStep as text
%        str2double(get(hObject,'String')) returns contents of editXStep as a double

set(handles.editXStepmm,'String',num2str(str2num(get(hObject,'String'))/157.480315))

% --- Executes during object creation, after setting all properties.
function editXStep_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editXStep (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editYStart_Callback(hObject, eventdata, handles)
% hObject    handle to editYStart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editYStart as text
%        str2double(get(hObject,'String')) returns contents of editYStart as a double

set(handles.editYStartmm,'String',num2str(str2num(get(hObject,'String'))/157.480315))

% --- Executes during object creation, after setting all properties.
function editYStart_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editYStart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editYStop_Callback(hObject, eventdata, handles)
% hObject    handle to editYStop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editYStop as text
%        str2double(get(hObject,'String')) returns contents of editYStop as a double
set(handles.editYStopmm,'String',num2str(str2num(get(hObject,'String'))/157.480315))


% --- Executes during object creation, after setting all properties.
function editYStop_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editYStop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editYStep_Callback(hObject, eventdata, handles)
% hObject    handle to editYStep (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editYStep as text
%        str2double(get(hObject,'String')) returns contents of editYStep as a double
set(handles.editYStepmm,'String',num2str(str2num(get(hObject,'String'))/157.480315))


% --- Executes during object creation, after setting all properties.
function editYStep_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editYStep (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editZStart_Callback(hObject, eventdata, handles)
% hObject    handle to editZStart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editZStart as text
%        str2double(get(hObject,'String')) returns contents of editZStart as a double
set(handles.editZStartmm,'String',num2str(str2num(get(hObject,'String'))/157.480315))


% --- Executes during object creation, after setting all properties.
function editZStart_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editZStart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editZStop_Callback(hObject, eventdata, handles)
% hObject    handle to editZStop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editZStop as text
%        str2double(get(hObject,'String')) returns contents of editZStop as a double
set(handles.editZStopmm,'String',num2str(str2num(get(hObject,'String'))/157.480315))


% --- Executes during object creation, after setting all properties.
function editZStop_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editZStop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editZStep_Callback(hObject, eventdata, handles)
% hObject    handle to editZStep (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editZStep as text
%        str2double(get(hObject,'String')) returns contents of editZStep as a double
set(handles.editZStepmm,'String',num2str(str2num(get(hObject,'String'))/157.480315))

% --- Executes during object creation, after setting all properties.
function editZStep_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editZStep (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in pushbuttonConnectScope.
function pushbuttonConnectScope_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonConnectScope (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Channel RecordLength
visaAddress = 'USB::0x0699::0x0408::C034356::INSTR';
ChannelNUM= Channel;
RL=RecordLength;
OpenScope(visaAddress,ChannelNUM,RL);

% Connect device object to hardware.
set(handles.textStatusScope,'String','Status: Connected')
set(handles.textCurrent,'String','Oscilloscope Ready')


% --- Executes on button press in pushbuttonDisconnectScope.
function pushbuttonDisconnectScope_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonDisconnectScope (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global deviceObj

fclose(deviceObj);
clear deviceObj

set(handles.textStatusScope,'String','Status: Disconnected')
set(handles.textCurrent,'String','Oscilloscope off')

% --- Executes on button press in pushbuttonCurrentWaveform.
function pushbuttonCurrentWaveform_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonCurrentWaveform (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global deviceObj Channel

%groupObj = get(deviceObj, 'Waveform');
%[Y, X, YUNIT, XUNIT] = invoke(groupObj, 'readwaveform', 'channel1');
if Channel==1
fprintf(deviceObj, 'DATa:SOUrce CH1');
elseif Channel==2
    fprintf(deviceObj, 'DATa:SOUrce CH2');
end

flushinput(deviceObj);
    
% Request the CURVE
fprintf(deviceObj, 'CURVE?');
Y = binblockread(deviceObj,'int8');

set(handles.textCurrent,'String','Plotting Current Waveform')
figure('Name','Current Waveform')
plot(Y)

function editXStartmm_Callback(hObject, eventdata, handles)
% hObject    handle to editXStartmm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editXStartmm as text
%        str2double(get(hObject,'String')) returns contents of editXStartmm as a double
set(handles.editXStart,'String',num2str(str2num(get(hObject,'String'))*157.480315))

% --- Executes during object creation, after setting all properties.
function editXStartmm_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editXStartmm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editYStartmm_Callback(hObject, eventdata, handles)
% hObject    handle to editYStartmm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editYStartmm as text
%        str2double(get(hObject,'String')) returns contents of editYStartmm as a double
set(handles.editYStart,'String',num2str(str2num(get(hObject,'String'))*157.480315))


% --- Executes during object creation, after setting all properties.
function editYStartmm_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editYStartmm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editZStartmm_Callback(hObject, eventdata, handles)
% hObject    handle to editZStartmm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editZStartmm as text
%        str2double(get(hObject,'String')) returns contents of editZStartmm as a double
set(handles.editZStart,'String',num2str(str2num(get(hObject,'String'))*157.480315))


% --- Executes during object creation, after setting all properties.
function editZStartmm_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editZStartmm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editXStopmm_Callback(hObject, eventdata, handles)
% hObject    handle to editXStopmm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editXStopmm as text
%        str2double(get(hObject,'String')) returns contents of editXStopmm as a double
set(handles.editXStop,'String',num2str(str2num(get(hObject,'String'))*157.480315))


% --- Executes during object creation, after setting all properties.
function editXStopmm_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editXStopmm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editYStopmm_Callback(hObject, eventdata, handles)
% hObject    handle to editYStopmm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editYStopmm as text
%        str2double(get(hObject,'String')) returns contents of editYStopmm as a double
set(handles.editYStop,'String',num2str(str2num(get(hObject,'String'))*157.480315))


% --- Executes during object creation, after setting all properties.
function editYStopmm_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editYStopmm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editZStopmm_Callback(hObject, eventdata, handles)
% hObject    handle to editZStopmm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editZStopmm as text
%        str2double(get(hObject,'String')) returns contents of editZStopmm as a double
set(handles.editZStop,'String',num2str(str2num(get(hObject,'String'))*157.480315))


% --- Executes during object creation, after setting all properties.
function editZStopmm_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editZStopmm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editXStepmm_Callback(hObject, eventdata, handles)
% hObject    handle to editXStepmm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editXStepmm as text
%        str2double(get(hObject,'String')) returns contents of editXStepmm as a double
set(handles.editXStep,'String',num2str(str2num(get(hObject,'String'))*157.480315))

% --- Executes during object creation, after setting all properties.
function editXStepmm_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editXStepmm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editYStepmm_Callback(hObject, eventdata, handles)
% hObject    handle to editYStepmm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editYStepmm as text
%        str2double(get(hObject,'String')) returns contents of editYStepmm as a double
set(handles.editYStep,'String',num2str(str2num(get(hObject,'String'))*157.480315))


% --- Executes during object creation, after setting all properties.
function editYStepmm_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editYStepmm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editZStepmm_Callback(hObject, eventdata, handles)
% hObject    handle to editZStepmm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editZStepmm as text
%        str2double(get(hObject,'String')) returns contents of editZStepmm as a double
set(handles.editZStep,'String',num2str(str2num(get(hObject,'String'))*157.480315))


% --- Executes during object creation, after setting all properties.
function editZStepmm_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editZStepmm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbuttonSetZeroX.
function pushbuttonSetZeroX_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonSetZeroX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s
fprintf(s,'F,C,IA1M-0,R')
updatePosition(handles)

% --- Executes on button press in pushbuttonSetZeroY.
function pushbuttonSetZeroY_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonSetZeroY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s
fprintf(s,'F,C,IA2M-0,R')
updatePosition(handles)

% --- Executes on button press in pushbuttonSetZeroZ.
function pushbuttonSetZeroZ_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonSetZeroZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s
fprintf(s,'F,C,IA3M-0,R')
updatePosition(handles)
set(handles.textCurrent,'String','All coordinates set to zero')

% --- Executes on button press in pushbuttonSetAllZero.
function pushbuttonSetAllZero_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonSetAllZero (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s
fprintf(s,'F,C,IA1M-0,IA2M-0,IA3M-0,R')
updatePosition(handles)

% --- Executes when selected object is changed in uibuttongroupUnits.
function uibuttongroupUnits_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroupUnits 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

toggleStates(handles)

% --- Executes when selected object is changed in uibuttongroupScanAxes.
function uibuttongroupScanAxes_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroupScanAxes 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
toggleStates(handles)

% --- Exeutes when selected object is changed in uibuttongroupChannel.
function uibuttongroupChannel_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroupChannel 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Select(handles)


function editPauseTime_Callback(hObject, eventdata, handles)
% hObject    handle to editPauseTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editPauseTime as text
%        str2double(get(hObject,'String')) returns contents of editPauseTime as a double
global PauseTime 
PauseTime=str2num(get(handles.editPauseTime,'String'));
set(handles.textCurrent,'String','Pause time set')


% --- Executes during object creation, after setting all properties.
function editPauseTime_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editPauseTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbuttonSetHome.
function pushbuttonSetHome_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonSetHome (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s
fprintf(s,'N');
fprintf('Current position set as home \n')
set(handles.textCurrent,'String','Current position set as home')

% --- Executes on button press in pushbuttonReturnHome.
function pushbuttonReturnHome_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonReturnHome (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s 
Mtr=s;
ReturnHome(Mtr);
updatePosition(handles)
set(handles.textCurrent,'String','Scan arm returned home')

% --- Executes on button press in RasterReturnHome.
function RasterReturnHome_Callback(hObject, eventdata, handles)
% hObject    handle to RasterReturnHome (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of RasterReturnHome

global RasterReturnHome

if (get(hObject,'Value') == get(hObject,'Max'))
	RasterReturnHome=1;
else
	RasterReturnHome=0;
end

function editAverage_Callback(hObject, eventdata, handles)
% hObject    handle to editAverage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editAverage as text
%        str2double(get(hObject,'String')) returns contents of editAverage as a double
global Average
Average=str2num(get(handles.editAverage,'String'));

if isempty(str2num(get(handles.editAverage,'String')))==1
    Average=1;
end

set(handles.textCurrent,'String','Averaging Set')    

% --- Executes during object creation, after setting all properties.
function editAverage_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editAverage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbuttonSaveData.
function pushbuttonSaveData_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonSaveData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global File Folder Position Data ScopeSettings ScanProp
filename=File;
foldername=Folder;
f=fullfile('C:\','Users','Experiment','Documents','scanarmgui1',foldername);

if exist(f)==7
    save([f '\' filename],'Position','Data','ScopeSettings','ScanProp')
    disp('Data Saved Successfully')
else
    mkdir(f)
    save([f '\' filename],'Position','Data','ScopeSettings','ScanProp')
    disp('Making Directory: Data Saved Successfully')
end 
set(handles.textCurrent,'String', 'Data Saved Successfully')


function editFileName_Callback(hObject, eventdata, handles)
% hObject    handle to editFileName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editFileName as text
%        str2double(get(hObject,'String')) returns contents of editFileName as a double
global File
File=get(handles.editFileName,'String');
set(handles.textCurrent,'String','File Name Selected')

% --- Executes during object creation, after setting all properties.
function editFileName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editFileName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editFolder_Callback(hObject, eventdata, handles)
% hObject    handle to editFolder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editFolder as text
%        str2double(get(hObject,'String')) returns contents of editFolder as a double
global Folder
Folder=get(handles.editFolder,'String');
set(handles.textCurrent,'String','Folder Name Selected')


% --- Executes during object creation, after setting all properties.
function editFolder_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editFolder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenuRecordLength.
function popupmenuRecordLength_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenuRecordLength (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenuRecordLength contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenuRecordLength
global RecordLength

r=get(handles.popupmenuRecordLength,'Value');

if isempty(get(handles.popupmenuRecordLength,'Value'))==1
    r=1;
end

 if r==1
        RecordLength=1e3;
 elseif r==2 
        RecordLength=1e4;
 elseif r==3
        RecordLength=1e5;
 elseif r==4
        RecordLength=1e6;
 elseif r==5
        RecordLength=5e6;
 elseif r==6
        RecordLength=1e7;
 end
 set(handles.textCurrent,'String','Record Length Selected')
 
 
% --- Executes during object creation, after setting all properties.
function popupmenuRecordLength_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenuRecordLength (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editRecordTime_Callback(hObject, eventdata, handles)
% hObject    handle to editRecordTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editRecordTime as text
%        str2double(get(hObject,'String')) returns contents of editRecordTime as a double
global RecordTime
RecordTime=str2num(get(handles.editRecordTime,'String'));

if isempty(get(handles.editRecordTime,'String'))==1
    RecordTime=1;
end
set(handles.textCurrent,'String','Record Time Set')


% --- Executes during object creation, after setting all properties.
function editRecordTime_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editRecordTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbuttonReadScope.
function pushbuttonReadScope_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonReadScope (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global RecordTime PauseTime Channel deviceObj Data ScopeSettings

dObj=deviceObj;
Chan=Channel;
Rt=RecordTime;
Pt=PauseTime;
% x=round(Rt/Pt); 
% 
% if x < 1
%     error('Record Time must equal or be greater than Pause Time')
%     set(handles.textCurrent,'String','Record Time must equal or be greater than Pause Time')
% end

[Data, ScopeSettings] = ...
    ScopeReadout(dObj,Chan, Rt, Pt);
set(handles.textCurrent,'String','Reading oscilloscope')

% --- Executes during object deletion, before destroying properties.
function radiobutton33_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to radiobutton33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in radiobuttonCH1.
function radiobuttonCH1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobuttonCH1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobuttonCH1

% --- Executes on button press in radiobuttonCH1.
function radiobuttonCH2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobuttonCH2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobuttonCH2


% --- Executes on button press in pushbuttonPlaneMax.
function pushbuttonPlaneMax_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonPlaneMax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Print the command to kill previous commands to the VelMotor object
global s Position Data

% Kill previous commands
fprintf(s,'K,F,C,setM1M4,setM2M4,setM3M5');

% Tell user what is going on
fprintf('Previous commands cleared \n');
set(handles.textCurrent,'String','Previous commands cleared')

% Go to plane max
dt=Data;
ps=Position;

GoToPlaneMax(dt, ps);
set(handles.textCurrent,'String','Moved to plane maximum')


% --------------------------------------------------------------------
function Help_Callback(hObject, eventdata, handles)
% hObject    handle to Help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open('Scan Arm GUI Documentation.md')
