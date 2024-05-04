function [Prediction, MotionVector, Flag] = Logarithmic_MotionSearch_MacroBlock(Target, Reference, x, y)
    % Extracting the size of the target image
    [M, N] = size(Target);

    % Initialize variables for calculations
    minX = x;    % X coordinate for best macroblock, with smallest SAD
    minY = y;    % Y coordinate for best macroblock, with smallest SAD  
    minSAD = 16*16*256;    % Setting large value for minimum SAD to ensure accuracy
    threshold = 2048;    % Threshold value as provided in lab document
    p = 8;    % Search area as provided in lab document
    initialX = x;    % Initial x coordinate to start with
    initialY = y;    % Initial y coordinate to start with

    % Initializing the returned values to 0
    Prediction = zeros(16, 16);
    MotionVector = zeros(1, 2);
    Flag = 0;
    
    % Setting the initial offset value
    offset = p / 2;
    
    % Iterating until offset reaches a value of one
    while offset > 1
        for i = -1:1
            for j = -1:1
                % Calculating the x coordinate to be considered for this macroblock, taking into consideration the calculated offset
                xP = initialX + i * offset;
                % Calculating the y coordinate to be considered for this macroblock, taking into consideration the calculated offset
                yP = initialY + j * offset;

                % Error checking for out of bounds
                if xP < 1 || yP < 1 || xP > M - 15 || yP > N - 15
                    continue;
                end
                
                % Calling a helper function that calculates the SAD
                currentSAD = calculateSAD(Target, Reference, initialX, initialY, xP, yP);

                % Comparing and replacing the SAD accordingly
                if currentSAD < minSAD
                    minSAD = currentSAD;
                    minX = xP;
                    minY = yP;
                end
            end
        end
        % Recalculating the new offset value
        offset = offset / 2;
        % Resetting the x coordinate accordingly
        initialX = minX;
        % Resetting the y coordinate accordingly
        initialY = minY;
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
