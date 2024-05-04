% Initializing a 10x10 pixel black image
checkerBoard = zeros(10, 10, 3);

% When the row index is odd, the white square is at the odd column index
% When the row index is even, the white square is at the even column index

% Iterating through (odd, odd) pixel coordinates and setting it to white
checkerBoard(1:2:end, 1:2:end, 1:3) = 255;
% Iterating through (even, even) pixel coordinates and setting it to white
checkerBoard(2:2:end, 2:2:end, 1:3) = 255;

% Any (odd, even) or (even, odd) pixel coordinates remain as black

% Displaying the black and white checkerboard
figure();
checkerBoard = uint8(checkerBoard);
image(checkerBoard);
title('Checkerboard');
axis image;
%-------------------------------------------------------------------------------------------%
% 4x4 RED CENTRAL REGION (Rows and Columns 4 through 7)

% When the row index is odd, the red square is at the even column index
% When the row index is even, the red square is at the odd column index

% Iterating through (even, odd) pixel coordinates and setting it to red
checkerBoard(4:2:7, 5:2:7, 1) = 255;
% Iterating through (odd, even) pixel coordinates and setting it to red
checkerBoard(5:2:7, 4:2:7, 1) = 255;

% Any (even, even) or (odd, odd) pixel coordinates remain white

% Displaying the checkerboard with red central region
figure();
checkerBoard = uint8(checkerBoard);
image(checkerBoard);
title('Checkerboard With Red Central Region');
axis image;