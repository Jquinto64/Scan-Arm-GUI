function saveData=ReadScope(Scope,verticalScale,yOffset,Av,NPoints,Pause)

fprintf('Reading Data from Oscilloscope \n');

if Pause > 0
    pause(Pause);
end

% Allocate waveform array
waveform = zeros([1 NPoints ]);

for sample = 1:Av
    % Clear the Buffer
    flushinput(Scope);
    
    % Request the CURVE
     fprintf(Scope, 'DATa:START 1');
     fprintf(Scope, ['Data:STOP ' num2str(NPoints)]); 
     fprintf(Scope, 'CURVE?');
    
    % Read the data and transform according to the vertical scale and Y-offset
    newSample = ((verticalScale/25) * (binblockread(Scope,'int8')))' + yOffset;
    
    % Make sure the length of the data read is NPoints?
    while length(newSample)~=NPoints
        length(newSample)
    end
    
    % Implment averaging
    waveform = waveform + newSample;

end

% Save aspects of the data to a return object 'saveData'
saveData.Max = max(waveform(:))/Av;
saveData.Min = min(waveform(:))/Av;
saveData.Mean = mean(waveform(:))/Av;
saveData.Waveform = waveform/Av;
%saveData.Waveform = [];
% after all waveform data is collected, find average along column of waveform data to find mean waveform

% Clear the oscilloscope Buffer
flushinput(Scope);
end