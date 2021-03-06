function [Header, Number] = ExcelRead(PathName, FileName)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       "xlsread" is commonly used to import Excel files in MATLAB. When
%   a data file has non-numeric columns either at the beginning or at the 
%   end, "xlsread" includes those columns in the header instead of numeric
%   values. This leads to mismatch between the header cell array and the
%   numbers array.
%       "ExcelRead" uses the raw values and convert it to a correctly
%   matched header and a numbers array.

%% Read in the file as usual, using xlsread. 
[NUM,TXT,RAW]=xlsread([PathName, FileName]);


NRow_NUM = size(NUM,1);        % Count the number of rows in the NUM part
NRow_RAW = size(RAW,1);        % Count the number of rows in the RAW part

Header      = RAW(1:(NRow_RAW-NRow_NUM),:);       % Header includes top rows that are not part of NUM
Number_Temp = RAW((NRow_RAW-NRow_NUM)+1:end,:);   % Save the bottom part (NUM rows) in a temp place

Number      = zeros(size(Number_Temp));           % Initialize the Number array
for i=1:size(Number_Temp,1)
    for j=1:size(Number_Temp,2)
        if isnumeric(Number_Temp{i,j})            % If the element is numeric, copy it to Numbers
            Number(i,j) = Number_Temp{i,j};
        end
    end
end
