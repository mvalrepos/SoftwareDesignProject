function [outputBackground,outputForeground] = f_addButtonToMatrix(inputButtonWord,inputBackground,inputForeground,spaceOnMatrix,startingRow,startingCol)
%F_ADDBUTTONTOMATRIX Summary of this function goes here
%   Detailed explanation goes here
% this function should only be used where the only input is clicking, otherwise the movement can override the

% adds the word inside the button boundaries

rowButtonIndex = startingRow;
colButtonIndex = startingCol;
workingButtonMatrix = inputBackground;

spr_leftEndButton = 193;
spr_rightEndButton = 195;
spr_midButton = 194;

% function here that adds the button sprites in the same space as the words
for i = 1:length(inputButtonWord)
    if i == 1
        % append a left end piece instead
        workingButtonMatrix(rowButtonIndex,colButtonIndex + (i-1)) = spr_leftEndButton;
    elseif i == length(inputButtonWord)
        % append a right end piece instead
        workingButtonMatrix(rowButtonIndex,colButtonIndex + (i-1)) = spr_rightEndButton;

    else
        % append a middle piece
        workingButtonMatrix(rowButtonIndex,colButtonIndex + (i-1)) = spr_midButton;
    end
end

% output both matrixes

outputBackground = workingButtonMatrix;
outputForeground = f_addWordToMatrix(inputButtonWord, inputForeground,length(inputForeground), startingRow, startingCol);

end