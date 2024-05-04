% Reading in the image file
jellyBeans = imread("jbeans.ppm");

% Displaying the original RGB image file
figure();
image(jellyBeans);
title('Original Image of Jellybeans');
axis image;

% Converting to YCbCr image
yccImage = rgb2ycc(jellyBeans);

% Displaying YCbCr image
figure();
imagesc(uint8(yccImage));
title('YCbCr Converted Image of Jellybeans')
axis image;

% Displaying only the Y channel of the YCbCr image
figure();
imagesc(uint8(yccImage(:, :, 1)));
title('Y-Channel of YCbCr Jellybeans');
axis image;

% Displaying only the Cr channel of the YCbCr image
figure();
imagesc(uint8(yccImage(:, :, 3)));
title('Cr-Channel of YCbCr Jellybeans');
axis image;

% Converting back to RGB image
rgbImage = ycc2rgb(yccImage);

% Displaying RGB image
figure();
image(uint8(rgbImage));
title('Converted Back RGB Image of Jellybeans');
axis image;