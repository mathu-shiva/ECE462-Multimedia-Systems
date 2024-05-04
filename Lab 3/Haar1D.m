function transform1D = Haar1D(input)
    % Taking the length of the input for calculations
    N = length(input);
    % Initializing the output to zeroes
    transform1D = zeros(N, 1);
    % For loop iterates only through the first half of the elements
    for i = 1:N/2
        % Calculating the averages of consecutive pairs and placing in correct position of the transform
        transform1D(i) = ((input(2*i - 1) + input(2*i))/sqrt(2));
        % Calculating the differences of consecutive pairs and placing in correct position of the transform
        transform1D(i + N/2) = ((input(2*i - 1) - input(2*i))/sqrt(2));
    end
end