clc
clear
close all

blank_sprite = 1;
currentSprite = 1;

% TL_Wall = 625;
% TM_Wall = 626;
% TR_Wall = 627;
% ML_Wall = 657;
% MM_Wall = 658;
% MR_Wall = 659;
% BL_Wall = 689;
% BM_Wall = 690;
% BR_Wall = 691;

game_scene = simpleGameEngine('retro_pack.png',16,16,5,[125,125,125]);

world = ones(9,9);

background = world;
foreground = blank_sprite * ones(size(background));

drawScene(game_scene, background, foreground);

game = true;

while game 
    key = getKeyboardInput(game_scene);
    switch key
        case 'uparrow'
            currentSprite = currentSprite + 1;
        case 'downarrow'
            currentSprite = currentSprite - 1;
        case 'w'
            currentSprite = currentSprite + 10;
        case 's'
            currentSprite = currentSprite - 10;
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