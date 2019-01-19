function OpenScope(visaAddress, ChannelNUM, RL)

% Connect to Scope
global deviceObj 
deviceObj = visa('tek', visaAddress);
deviceObj.InputBufferSize = RL;
fopen(deviceObj);

% Switch Channel Number

switch ChannelNUM
    case 1
        fprintf(deviceObj, 'DATa:SOUrce CH1');
    case 2
        fprintf(deviceObj, 'DATa:SOUrce CH2');
end

recordLength = query(deviceObj, 'HOR:RECO?');

% Ensure that the start and stop values for CURVE query match the full
% record length
fprintf(deviceObj, ['DATA:START 1;DATA:STOP ' recordLength]);

% Request 8 bit binary data on the CURVE query
%fprintf(myScope, 'DATA:ENCDG RIBINARY;WIDTH 2');
fprintf(deviceObj, 'DATA:ENCDG RIBINARY;WIDTH 1');
end