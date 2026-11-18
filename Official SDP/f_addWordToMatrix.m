function [outputMatrix] = f_addWordToMatrix(inputWord,inputMatrix,spaceOnMatrix,startingRow,startingCol)
%F_ADDWORDTOMATRIX Summary of this function goes here

% inputWord = character matrix of word you want to insert into matrix
% inputMatrix = matrix you want to append the word to
% spaceOnMatrix = amount of space on the matrix you have (usually length(matrix) just works)
% startingRow = the row where you want the text to land
% startingCol = the column where you want the text to be (can be finneky sometimes)

%   Detailed explanation goes here
% Just a concatenation of f_wordToMatrix and f_appendWordToMatrix to reduce the lines in the script
titleTextMatrix = f_wordToMatrix(inputWord, spaceOnMatrix - (startingCol - 1));
outputMatrix = f_appendWordToMatrix(inputMatrix, titleTextMatrix, startingRow, startingCol);
end