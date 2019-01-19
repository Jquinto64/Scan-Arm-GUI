function Properties = SeparateCharString(String,separator)
%% SeparateCharString 
% a function to separate a long string into its various components using a 
% separator charater
% INPUTS: 
% String: a string of characters to be separated
% separator: the separator charater
% OUTPUT:
% Properties: a cell array of the separated charaters

cellNum = 1;
Properties = cell(length(strfind(String,separator))+1,1);

for i = 1:length(String)
    if String(i) ~= separator
        Properties{cellNum,1} = [Properties{cellNum,1} String(i)];
    else
        cellNum = cellNum + 1;
    end
end
end