function SAD = calculateSAD(T, R, x, y, i, j) 
    % Initialzing the SAD value to 0
    SAD = 0;
    % Iterating through the pixels of the macroblocks
    for k = 0:15
        for l = 0:15
            % Calculating the SAD value as per the lab document expression
            SAD = SAD + abs(T(x + k, y + l) - R(i + k, j + l)); 
        end
    end
end