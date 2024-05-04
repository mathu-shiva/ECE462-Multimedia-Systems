% Function that converts from RGB to YCbCr
function ycc_image = rgb2ycc(rgb_image)
    % Converting to double to manipulate image
    rgb_image = double(rgb_image);
    
    % Defining the colour channels accordingly to use the variables
    R = rgb_image(:, :, 1);
    G = rgb_image(:, :, 2);
    B = rgb_image(:, :, 3);

    % Provided values in lab document
    Y = ((75*R + 150*G + 29*B)/256);
    Cb = ((-44*R -87*G + 131*B)/256) + 128;
    Cr = ((130*R - 110*G - 21*B)/256) + 128;
    
    % Defining the luminance & chrominance channels from the variables
    ycc_image(:, :, 1) = Y;
    ycc_image(:, :, 2) = Cb;
    ycc_image(:, :, 3) = Cr;
end