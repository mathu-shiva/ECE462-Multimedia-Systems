% Creating the monochrome image

% Initializing 1000x1000 image (already black)
imageGrey = zeros(1000,1000,3);         

% Creating the blocks that are white according to pixel values
imageGrey(1:250, 1:250, 1:3) = 255;         
imageGrey(250:750, 250:750, 1:3) = 255;
imageGrey(750:1000, 750:1000, 1:3) = 255;

% Creating the blocks that are grey (127, 127, 127) according to pixel
% values
imageGrey(1:250, 250:750, 1:3) = 127;
imageGrey(250:750, 750:1000, 1:3) = 127;
imageGrey(750:1000, 1:250, 1:3) = 127;

% Displaying the created image
imageGrey = uint8(imageGrey);
image(imageGrey);
axis image;