function [Prediction, MotionVectors, Flag] = Logarithmic_MotionSearch(Target, Reference) 
    % Extracting the size of the target image
    [M, N] = size(Target);
    
    % Calculating the K Value
    K = M*N/256;    % 256 = 16^2, that is, MBSize * MBSeize

    % Initializing the outputs of the function to be 0
    MotionVectors = zeros(K, 2);
    Flag = zeros(K, 1);
    Prediction = zeros(M,N);
    counter = 0;
    
    % Iterating through every macroblock
    for x = 1:16:M
        for y = 1:16:N
            % Incrementing counter by 1 accordingly
            counter = counter + 1;
            % Call a helper function to carry out a sequential motion search on the macroblock, which returns the predicted macro block, motion vector, and the flag
            [mbp, mbmv, mbf] = Logarithmic_MotionSearch_MacroBlock(Target, Reference, x, y);
            
            % Updating the corresponding region in Prediction with the predicted macroblock
            Prediction(x:x+15, y:y+15) = mbp;
            % Updating the corresponding location in motionVectors with the found motion vector
            MotionVectors(counter, :) = mbmv(1, :);
            % Updating the corresponding location in Flag with the found flag
            Flag(counter, 1) = mbf;
        end
    end
end