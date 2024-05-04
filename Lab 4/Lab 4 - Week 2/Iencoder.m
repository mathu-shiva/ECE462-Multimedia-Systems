function constructedImage = Iencoder(currentFrame, QP, Qintra)
    % Retrieving the number of rows and columns of the input frame
    [M, N] = size(currentFrame);
    % Initializing the output to have the same dimensions as the input frame
    constructedImage = zeros(M, N);
    
    % Looping through every macroblock, using a step of 16, as each MB is 16x16
    for x = 1:16:M
        for y = 1:16:N
            % Initializing the final encoded MB to have the correct dimensions
            encodedMB = zeros(16, 16);
            % Extracting the macroblock from the current input frame
            MB = currentFrame(x:x+15,y:y+15);

            % Looping through 8x8 areas of the macroblock with a step of 8 to perform encoding
            for i = 1:8:16
                for j = 1:8:16
                % Performing a forward DCT quantization on the MB the iteration is currently on
                fDCTq = forward_dct_quant(MB(i:i+7,j:j+7), QP, Qintra);
                % Performing an inverse DCT quantization on the forward DCT quantization output
                iDCTq = inverse_dct_quant(fDCTq, QP, Qintra);
                % Saving the inverse DCT quantization output to the variable holding the final encoded MB that the iteration is currently on
                encodedMB(i:i+7, j:j+7) = iDCTq;
                end
            end
            % Adding the encoded macroblock to its respective area in the final constructed image
            constructedImage(x:x+15, y:y+15) = encodedMB;
        end
    end
end