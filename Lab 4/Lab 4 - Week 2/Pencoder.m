function constructedImage = Pencoder(referenceFrame, currentFrame, QP, Qintra, Qinter)
    % Retrieving the number of rows and columns of the input frame
    [M, N] = size(currentFrame);
    % Initializing the output to have the same dimensions as the input frame
    constructedImage = zeros(M, N);

    % Running a sequential motion search with the inputs; NB: Lab 4 sequential motion search function has errors I could not figure out
    [predictedImage, motionVectors, Flag] = Sequential_MotionSearch(currentFrame, referenceFrame);
    % Counter to keep track of which MB we are on
    counter = 1;

    % Looping through every macroblock, using a step of 16, as each MB is 16x16
    for x = 1:16:M
        for y = 1:16:N
            % If the flag is one, this indicates a successful sequential motion search
            if (Flag(counter) == 1)
                % Initializing the final encoded MB to have the correct dimensions
                encodedMB = zeros(16, 16);
                % Calculating the prediction error to use as input for the forward DCT quantization; current MB minus the predicted MB
                MB = currentFrame(x:x+15, y:y+15) - predictedImage(x:x+15, y:y+15);
                % Looping through 8x8 areas of the macroblock with a step of 8 to perform encoding
                for i = 1:8:16
                    for j = 1:8:16
                        % Performing a forward DCT quantization on the MB the iteration is currently on with Qinter for successful motion search
                        fDCTq = forward_dct_quant(MB(i:i+7, j:j+7), QP, Qinter);
                        % Performing an inverse DCT quantization on the MB the iteration is currently on with Qinter for successful motion search
                        iDCTq = inverse_dct_quant(fDCTq, QP, Qinter);
                        % Saving the inverse DCT quantization output to the variable holding the final encoded MB that the iteration is currently on
                        encodedMB(i:i+7, j:j+7) = iDCTq;
                    end
                end
                % Adding the encoded macroblock and predicted image to its respective area in the final constructed image
                constructedImage(x:x+15, y:y+15) = encodedMB + predictedImage(x:x+15, y:y+15);
                % Incrementing the counter to move to next MB and correctly retrieve the flag value
                counter = counter + 1;
            % If the flag is not one (ie. it is zero), this indicates an unsuccessful sequential motion search
            else
                % Initializing the final encoded MB to have the correct dimensions
                encodedMB = zeros(16, 16);
                % Using the current MB as input for the forward DCT quantization
                MB = currentFrame(x:x+15, y:y+15);
                % Looping through 8x8 areas of the macroblock with a step of 8 to perform encoding
                for i = 1:8:16
                    for j = 1:8:16
                        % Performing a forward DCT quantization on the MB the iteration is currently on with Qintra for unsuccessful motion search
                        fDCTq = forward_dct_quant(MB(i:i+7, j:j+7), QP, Qintra);
                        % Performing an inverse DCT quantization on the MB the iteration is currently on with Qintra for unsuccessful motion search
                        iDCTq = inverse_dct_quant(fDCTq, QP, Qintra);
                        % Saving the inverse DCT quantization output to the variable holding the final encoded MB that the iteration is currently on
                        encodedMB(i:i+7, j:j+7) = iDCTq;
                    end
                end
                % Adding the encoded macroblock to its respective area in the final constructed image
                constructedImage(x:x+15, y:y+15) = encodedMB;
                % Incrementing the counter to move to next MB and correctly retrieve the flag value
                counter = counter + 1;
            end
        end
    end
end