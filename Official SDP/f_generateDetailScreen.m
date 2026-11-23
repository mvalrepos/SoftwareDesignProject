function [isPickedUp, whatItemPickedUp, spriteIdPickedUp] = f_generateDetailScreen(templateMatrix,spriteNumOfFood,foodChar)
% Show a food's detail screen and ask the player to pick it up.

% opens a separate game window built from templateMatrix, draws the food's
% name, its sprite, and its nutrition info, then waits for the player to
% click yes or no sprite on the "Pick Up?" prompt. The screen fades out and the
% window closes once the player has chosen.
%
% Inputs:
%   templateMatrix   - menu background matrix (walls and blank tiles) to draw on
%   spriteNumOfFood  - sprite number of the food, drawn on the detail screen
%   foodChar         - name of the food as text (e.g. 'Apple'), shown as the title
%
% Outputs:
%   isPickedUp        - true if the player clicked Yes, false if they clicked No
%   whatItemPickedUp  - the food's name (same as foodChar)
%   spriteIdPickedUp  - spriteNumOfFood if picked up, otherwise 1 (blank)
%
%   Requires f_addWordToMatrix and f_fadeOut

detail_scene = simpleGameEngine('updatedretro_pack.png',16,16,5,[95,115,95]);
spr_blank = 1;
spr_yes = 824;
spr_no = 827;
background = templateMatrix;
startingRowForTitleText = 3;
startingColForTitleText = 3;
startingRowForDetailText = 3;
startingColForDetailText = 12;
pickupPromptRow = 8;
pickupPromptCol = 5;
foodRow = 5;
foodCol = 4;
clickCorrect = false;
spriteIdPickedUp = 1;

% correlate this to the item that the user picks up
whatItemPickedUp = foodChar;
background = f_addWordToMatrix(whatItemPickedUp, background, length(background), startingRowForTitleText, startingColForTitleText);
background(foodRow,foodCol) = spriteNumOfFood;
background = f_addWordToMatrix('Fiber', background, length(background), startingRowForDetailText, startingColForDetailText);
background = f_addWordToMatrix('Vitamins', background, length(background), startingRowForDetailText + 1, startingColForDetailText);

% prompt text
background = f_addWordToMatrix('Pick Up? {:}', background, length(background), pickupPromptRow, pickupPromptCol);
foreground = spr_blank * ones(size(background));
drawScene(detail_scene, background, foreground);
while ~clickCorrect
    [rowClicked,colClicked] = getMouseInput(detail_scene);
    [yRow,yCol] = find(background == spr_yes);
    [nRow,nCol] = find(background == spr_no);
    if ((yRow == rowClicked) && (yCol == colClicked))
        isPickedUp = true;
        clickCorrect = true;
        spriteIdPickedUp = spriteNumOfFood;
    elseif ((nRow == rowClicked) && (nCol == colClicked))
        isPickedUp = false;
        clickCorrect = true;
    else
        clickCorrect = false;
    end
end

% screen fade out
f_fadeOut(detail_scene, background, foreground, 0.6);

%closes the current window
close(detail_scene.my_figure);
end