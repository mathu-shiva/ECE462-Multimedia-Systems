function Output = inverse_dct_quant(Input, QP, Q_matrix)
    % Perform inverse quantization, given the formula found in the lab prep document
    tHat = Input.*QP.*Q_matrix;
    % Perform 2D inverse DCT on the T Hat, with the in-built MATLAB function as I was unable to complete Lab #2
    Output = idct2(tHat);
end