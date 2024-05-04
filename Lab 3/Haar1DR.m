function reverse1D = Haar1DR(input)
    % Taking the length of the input for calculations
    N = length(input);
    % Initializing the output to zeroes
    reverse1D = zeros(N, 1);
    % For loop iterates only through the first half of the elements
    for i = 1:N/2
        % Calculating the odd elements of the output
        reverse1D(2*i - 1) = ((input(i) + input(i + N/2))/sqrt(2));
        % Calculating the even elements of the output
        reverse1D(2*i) = ((input(i) - input(i + N/2))/sqrt(2));
    end
end