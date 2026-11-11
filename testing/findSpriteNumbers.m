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
% 0 = 948
% 1 = 949
% 2 = 950 
% 3 = 951
% 4 = 952
% 5 = 953
% 6 = 954
% 7 = 955
% 8 = 956
% 9 = 957
% : = 958
% . = 959   
% % = 960
% A = 980
% B = 981
% C = 982
% D = 983
% E = 984
% F = 985
% G = 986
% H = 987
% I = 988
% J = 989
% K = 990
% L = 991
% M = 992
% N = 1012
% O = 1013
% P = 1014
% Q = 1015
% R = 1016
% S = 1017
% T = 1018
% U = 1019
% V = 1020
% W = 1021
% X = 1022
% Y = 1023
% Z = 1024

game_scene = simpleGameEngine('retro_pack.png',16,16,5,[125,125,125]);

world = ones(9,9);

background = world;
foreground = blank_sprite * ones(size(background));

drawScene(game_scene, background, foreground);

listOfSpritesForStuff = [];
numberOfSpritesSaved = 1;

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
        case "e"
            listOfSpritesForStuff(numberOfSpritesSaved) = currentSprite;
            numberOfSpritesSaved = numberOfSpritesSaved + 1;
        otherwise
            disp("wrong key")
    end
    foreground(5,5) = currentSprite;
    drawScene(game_scene, background, foreground);
    disp(currentSprite);
end