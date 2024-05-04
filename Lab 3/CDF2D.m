function transform2D = CDF2D(input)
    % Initializing a 2D array to the same size as the input for iteration purposes
    [x, y] = size(input);
    % Initializing the output to the initially given input
    transform2D = input;
    % Looping through every column
    for j = 1:y
        % Performing CDF1D on each column of the input, then saving it in the output
        transform2D(:, j) = fwd_cdf(transform2D(:, j));
    end
    % Looping through every row
    for i = 1:x
        % Performing CDF1D on each row of the input, then saving it in the output
        transform2D(i, :) = fwd_cdf(transform2D(i, :));
    end
end
