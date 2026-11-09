clc
clear
close all

% all initial passing in of sprites needed for this part
blank_sprite = 1;
TL_Wall = 625;
TM_Wall = 626;
TR_Wall = 627;
ML_Wall = 657;
MM_Wall = 658;
MR_Wall = 659;
BL_Wall = 689;
BM_Wall = 690;
BR_Wall = 691;

% init game scene
game_scene = simpleGameEngine('retro_pack.png',16,16,5,[125,125,125]);

% large 10 x 10 (could be larger?) array to fit all the details we want about the food
world = [];

%
background = world;
foreground = blank_sprite * ones(size(background));

drawScene(game_scene, background, foreground);

game = true;

while game 
    key = getKeyboardInput(game_scene);
    switch key
        case 'y'
            % append sprite for apple to inventory array
        case 'n'
            % dont append sprite for apple to inventory array and close menu
        case 'escape'
            close all
            game = false;
            return;
        otherwise
            disp("wrong key")
    end
    foreground(5,5) = currentSprite;
    drawScene(game_scene, background, foreground);
    disp(currentSprite);
end