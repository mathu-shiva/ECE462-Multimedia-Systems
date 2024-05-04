function transform2D = Haar2D(input)
    % Initializing a 2D array to the same size as the input for iteration purposes
    [x, y] = size(input);
    % Initializing the output to the initially given input
    transform2D = input;
    % Looping through every column
    for j = 1:y
        % Performing Haar1D on each column of the input, then saving it in the output
        transform2D(:, j) = Haar1D(transform2D(:, j));
    end
    % Looping through every row
    for i = 1:x
        % Performing Haar1D on each row of the input, then saving it in the output
        transform2D(i, :) = Haar1D(transform2D(i, :));
    end
end