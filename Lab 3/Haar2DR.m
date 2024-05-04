function reverse2D = Haar2DR(input)
    % Initializing a 2D array to the same size as the input for iteration purposes
    [x, y] = size(input);
    % Initializing the output to the initially given input
    reverse2D = input;
    % Looping through every row
    for i = 1:x
        % Performing Haar1DR on each row of the input, then saving it in the output
        reverse2D(i, :) = Haar1DR(reverse2D(i, :));
    end
    % Looping through every column
    for j = 1:y
        % Performing Haar1DR on each column of the input, then saving it in the output
        reverse2D(:, j) = Haar1DR(reverse2D(:, j));
    end
end