function reverseL2D = CDFL2DR(input, L)
    % Finding and saving the number of rows and number of columns in the input
    [x, y] = size(input);
    % Setting the output to the intially provided input
    reverseL2D = input;
    % Iterating through each of the levels in descending order for the inverse
    for i = L:-1:1
        % Taking the top left quadrant image, reversing it, and then replacing it in the output
        % As we descend in the L value (largest L to smallest L), the LL quadrant gets larger, and reconstructs one image
        reverseL2D(1:x/2^(i - 1), 1:y/2^(i - 1)) = CDF2DR(reverseL2D(1:x/2^(i - 1), 1:y/2^(i - 1)));
    end
end
