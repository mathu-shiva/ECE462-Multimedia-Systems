% Initializing a 500x500 matrix for the image
A = zeros(500, 500, 3);

% Creating a random colour (pastel purple)
A(:, :, 1) = 195;
A(:, :, 2) = 177;
A(:, :, 3) = 245;

% Subtracting average of blue channel from itself and displaying in two lines of code
A(:, :, 3) = A(:, :, 3) - mean(A(:, :, 3), 'all');
image(uint8(A));
