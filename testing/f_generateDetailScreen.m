function [isPickedUp] = f_generateDetailScreen(templateMatrix,spriteNumOfFood)
%F_GENERATEDETAILSCREEN Summary of this function goes here
%   Detailed explanation goes here

detail_scene = simpleGameEngine('retro_pack.png',16,16,5,[95,115,95]);

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

background = f_addWordToMatrix('Apple', background, length(background), startingRowForTitleText, startingColForTitleText);
background(foodRow,foodCol) = spriteNumOfFood;
background = f_addWordToMatrix('Fiber', background, length(background), startingRowForDetailText, startingColForDetailText);
background = f_addWordToMatrix('Vitamins', background, length(background), startingRowForDetailText + 1, startingColForDetailText);
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
        close Figure 2;
    elseif ((nRow == rowClicked) && (nCol == colClicked))
        isPickedUp = false;
        clickCorrect = true;
        close Figure 2;
    else
        clickCorrect = false;
    end
end
end