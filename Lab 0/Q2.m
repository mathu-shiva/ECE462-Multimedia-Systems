% Initializing a 500x500 matrix for the image
A = zeros(500, 500, 3);

% Creating a random colour (pastel purple)
A(:, :, 1) = 195;
A(:, :, 2) = 177;
A(:, :, 3) = 245;

% Setting the green intensity to 0 and displaying in two lines of code
A(:, :, 2) = 0;
image(uint8(A));




