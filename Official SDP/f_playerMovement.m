function [outputPlayerRow,outputPlayerCol,gameState] = f_playerMovement(keyInput,inputPlayerRow,inputPlayerCol,backgroundMatrix)
%F_PLAYERMOVEMENT Move the player one tile based on a key press, with wall collision.
%   [outputPlayerRow, outputPlayerCol, gameState] = F_PLAYERMOVEMENT(keyInput, inputPlayerRow, inputPlayerCol, backgroundMatrix)
%   takes the key the player just pressed and returns the player's new grid
%   position. W/A/S/D move the player up/left/down/right by one tile, but the
%   move is rejected if the destination tile in backgroundMatrix is a wall or
%   is outside the matrix. Escape signals that the game should quit. Any
%   other key leaves the position unchanged.
%
% Inputs:
%   keyInput         - key name from getKeyboardInput (e.g. 'w', 'a', 's', 'd', 'escape')
%   inputPlayerRow   - the player's current row in the scene matrix
%   inputPlayerCol   - the player's current column in the scene matrix
%   backgroundMatrix - the scene's background sprite matrix (walls, goal, text, etc.)
%
% Outputs:
%   outputPlayerRow  - the player's row after the move (unchanged if blocked or no move)
%   outputPlayerCol  - the player's column after the move (unchanged if blocked or no move)
%   gameState        - true to keep the game running, false if Escape was pressed
%
% Keybinds:
%   'w' / 's'   - row - 1 / row + 1 (up / down)
%   'a' / 'd'   - column - 1 / column + 1 (left / right)
%   'escape'    - closes all figures and returns gameState = false
%   anything else - prints an error message and does not move the player

% sprite numbers that block movement (same values as the main script)
wallSprites = [625 626 627 ...   % TL_Wall TM_Wall TR_Wall
    657 658 659 ...   % LM_Wall MM_Wall RM_Wall
    689 690 691];     % BL_Wall BM_Wall BR_Wall

% defaults so the outputs are always defined, even for non-movement keys
outputPlayerRow = inputPlayerRow;
outputPlayerCol = inputPlayerCol;
gameState = true;

% the tile the player is trying to move into (starts as the current tile)
targetRow = inputPlayerRow;
targetCol = inputPlayerCol;

switch keyInput
    case 'w'
        targetRow = targetRow - 1;
    case 'a'
        targetCol = targetCol - 1;
    case 's'
        targetRow = targetRow + 1;
    case 'd'
        targetCol = targetCol + 1;
    case 'escape'
        % return early: the position outputs keep their unchanged defaults
        close all
        gameState = false;
        return;
    otherwise
        disp("error - wrong key")
end

% blocked tiles are the nine wall sprites (TL/TM/TR, LM/MM/RM, BL/BM/BR).
% every other tile (blank floor, goal, apple) is walkable. To make another
% tile solid, add its sprite number to the wallSprites list below.
% bounds first so we never index outside the matrix
[numRows, numCols] = size(backgroundMatrix);
inBounds = (targetRow >= 1) && (targetRow <= numRows) && (targetCol >= 1) && (targetCol <= numCols);

if inBounds && ~ismember(backgroundMatrix(targetRow,targetCol), wallSprites)
    outputPlayerRow = targetRow;
    outputPlayerCol = targetCol;
end
% otherwise the move is blocked and the outputs stay at the old position
end