function [outputPlayerRow,outputPlayerCol,gameState] = f_playerMovement(keyInput,inputPlayerRow,inputPlayerCol)
%F_PLAYERMOVEMENT Summary of this function goes here
%   Detailed explanation goes here

player_row = inputPlayerRow;
player_col = inputPlayerCol;

% these r here so the function doesnt get mad when we press anything but movement
outputPlayerRow = inputPlayerRow;
outputPlayerCol = inputPlayerCol;
gameState = true;

switch keyInput
    case 'w'
        player_row = player_row - 1;
    case 'a' 
        player_col = player_col - 1;
    case 's' 
        player_row = player_row + 1;
    case 'd' 
        player_col = player_col + 1;
    case 'e'
        if (player_col == goal_col && player_row == goal_row)
            % how to do this through outputs?
            foreground1(:,:) = spr_fade1;
            drawScene(game_scene, background1, foreground1);
            pause(0.5);
            foreground1(:,:) = spr_fade2;
            drawScene(game_scene, background1, foreground1);
            pause(0.45);
            foreground1(:,:) = spr_fade3;
            drawScene(game_scene, background1, foreground1);
            pause(0.25);
            scene1 = true;
            pickedUp = f_generateDetailScreen(menuTemplate, spr_Apple);
            if pickedUp
                disp("yes you picked up the apple")
            else
                disp("no you did not pick up the apple")
            end
            % disabled 2nd scene functionality temporarily
            %scene2 = true;
        end
    case 'escape'
        close all
        gameState = false;
        return;
    otherwise
        disp("err wrong key")
end

outputPlayerRow = player_row;
outputPlayerCol = player_col;

end