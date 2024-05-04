function reverse2D = CDF2DR(input)
    % Initializing a 2D array to the same size as the input for iteration purposes
    [x, y] = size(input);
    % Initializing the output to the initially given input
    reverse2D = input;
    % Looping through every row
    for i = 1:x
        % Performing CDF1DR on each row of the input, then saving it in the output
        reverse2D(i, :) = rev_cdf(reverse2D(i, :));
    end
    % Looping through every column
    for j = 1:y
        % Performing CDF1DR on each column of the input, then saving it in the output
        reverse2D(:, j) = rev_cdf(reverse2D(:, j));
    end
end
