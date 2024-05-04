function transformL2D = CDFL2D(input, L)
    % Finding and saving the number of rows and number of columns in the input
    [x,y] = size(input);
    % Setting the output to the intially provided input
    transformL2D = input;
    % setting the temporary variable to the intially provided input
    tempL2D = input;
    % Iterating through each of the levels
    for i = 1:L
        % Computing the Haar transform of the appropriate input, then
        % saving it to the top left quadrant of the output (after the first iteration)
        transformL2D(1:x/2^(i - 1), 1:y/2^(i - 1)) = CDF2D(tempL2D);
        % Taking the top left quadrant of the image that was transformed
        % and saving it in the temporary variable to use as the new input for the next iteration
        tempL2D = transformL2D(1:x/2^i, 1:y/2^i);
    end
end
