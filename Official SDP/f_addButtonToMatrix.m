function [outputBackground,outputForeground] = f_addButtonToMatrix(inputButtonWord,inputBackground,inputForeground,spaceOnMatrix,startingRow,startingCol)
% Draw a button and its label into the scene layers.
% Adds left/middle/right button sprites to the background matrix across
% the width of inputButtonWord, then writes the word into the foreground
% matrix at the same position. Returns both updated matrices.
%
% Inputs:
%   inputButtonWord  - the label for the button; its length sets the button's width
%   inputBackground  - background layer matrix (the button sprites go here)
%   inputForeground  - foreground layer matrix (the label goes here)
%   spaceOnMatrix    - currently unused
%   startingRow      - row in the scene where the button goes
%   startingCol      - column in the scene where the button's left end goes
%
%   Outputs:
%     outputBackground - background matrix with the button sprites added
%     outputForeground - foreground matrix with the label added

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
% output both matrices
outputBackground = workingButtonMatrix;
outputForeground = f_addWordToMatrix(inputButtonWord, inputForeground,length(inputForeground), startingRow, startingCol);
end