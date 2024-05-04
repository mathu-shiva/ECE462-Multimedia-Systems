function [Prediction, MotionVector, Flag] = Sequential_MotionSearch_MacroBlock(Target, Reference, x, y)
    % Extracting the size of the target image
    [M, N] = size(Target);

    % Initialize variables for calculations
    minX = x;    % X coordinate for best macroblock, with smallest SAD
    minY = y;    % Y coordinate for best macroblock, with smallest SAD
    minSAD = 16*16*256;    % Setting large value for minimum SAD to ensure accuracy
    threshold = 2048;    % Threshold value as provided in lab document
    p = 8;    % Search area as provided in lab document
    
    % Initializing the returned values to 0
    Prediction = zeros(16, 16);
    MotionVector = zeros(1, 2);
    Flag = 0;
    
    % Error checking for out of bounds
    if x < 1 || y < 1 || x > M - 15 || y > N - 15
        return; % Return to end
    end

    % Iterating though the searching area, which is +- 8 as provided in lab document
    for i = -p:p
        for j = -p:p
            % Coordinates of the candidate macroblock
            rX = x + i;
            rY = y + j;

            % Error checking
            if rX < 1 || rY < 1 || rX > M - 15 || rY > N - 15
               continue 
            end 

            % Calling a helper function that calculates the SAD
            currentSAD = calculateSAD(Target, Reference, x, y, rX, rY);
            
            % Comparing and replacing the SAD accordingly
            if currentSAD < minSAD
                minSAD = currentSAD;
                minX = rX;
                minY = rY;
            end
        end
    end
    
    % If the minimum SAD is below the threshold
    if minSAD < threshold
        % Updating the Prediction output accordingly
        Prediction = Reference(minX:minX+15, minY:minY+15);
        % Updating the Motion Vectors output accordingly
        MotionVector(1, 1) = minX - x;
        MotionVector(1, 2) = minY - y;
        % Setting Flag to 1 for successful motion search
        Flag = 1;
    end
end
