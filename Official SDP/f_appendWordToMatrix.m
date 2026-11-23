function [outputMatrix] = f_appendWordToMatrix(inputMatrix,inputWordMatrix,startingRow,startingCol)
% Stamp a word's sprite matrix into a scene matrix.
% Returns a copy of inputMatrix with inputWordMatrix written in, its
% top-left corner at (startingRow, startingCol).

% matrix we work in (the actual scene we're putting the word in)
workingMatrix = inputMatrix;
% matrix of word we input
wordMatrix = inputWordMatrix;
% matrix we output at end
outputMatrix = [];
% column index starting at the according column based on input
columnIndex = startingCol;
% row index starting at the according row based on input
rowIndex = startingRow;

% make sure the word actually fits in the scene before we start writing
if startingRow < 1 || startingCol < 1 || ...
        startingRow + height(wordMatrix) - 1 > height(workingMatrix) || ...
        startingCol + width(wordMatrix) - 1 > width(workingMatrix)
    error('f_appendWordToMatrix:outOfBounds', ...
        'Word does not fit in the scene at the given position.');
end

% loops for however many rows we have
for i = 1:height(wordMatrix)
    % nested loop that loops for however many columns we have
    % (width, not length: length returns the larger dimension)
    for j = 1:width(wordMatrix)
        % change the value at the row and column we want the word to the sprite of the letter in the word at that point
        workingMatrix(rowIndex,columnIndex) = wordMatrix(i,j);
        % move over to the next column
        columnIndex = columnIndex + 1;
    end
    % when we've gone all the way through the first row of the word, go to the next and restart from starting column
    rowIndex = rowIndex + 1;
    columnIndex = startingCol;
end
% no need to change anything here just output the working matrix when its finished
outputMatrix = workingMatrix;
end