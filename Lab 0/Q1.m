% Creating blue image with white cross
imageBlue = zeros(300, 300, 3);          % Initializing a 300 x 300 matrix for RGB image
imageBlue(:, :, 3) = 255;               % Setting the B channel only to 255 throughout whole image
imageBlue(:, 150:151, 1:3) = 255;       % Setting RGB channels all to 255 for two columns across all rows for white
imageBlue(150:151, :, 1:3) = 255;       % Setting RGB channels all to 255 for two rows across all columns for white

% Displaying the created image
imageBlue = uint8(imageBlue);
image(imageBlue);
axis image;
