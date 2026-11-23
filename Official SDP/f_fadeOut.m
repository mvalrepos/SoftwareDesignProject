function [background, foreground] = f_fadeOut(game_scene, background, foreground, totalTime)
% top-to-bottom wipe that speeds up as it goes
% always uses the same fade sprites as the main file

spr_fade2 = 856;   % same value as spr_fade2 in the main file
spr_fade3 = 888;   % same value as spr_fade3 in the main file

nRows = height(foreground);                  % scalar
weights = linspace(1, 0.3, nRows);           % array

% method used for adjustable transition time (why totalTime input exists)
% this makes the last pause <weight>% faster than the first pause and
% evenly dispersed in each pause between
delays = totalTime * weights / sum(weights); % scalar * array

for i = 1:nRows
    background(i,:) = spr_fade2;
    if i > 1
        foreground(i-1,:) = spr_fade3;
    end
    drawScene(game_scene, background, foreground);
    pause(delays(i));
end

foreground(:,:) = spr_fade3;
drawScene(game_scene, background, foreground);
pause(0.1);
end