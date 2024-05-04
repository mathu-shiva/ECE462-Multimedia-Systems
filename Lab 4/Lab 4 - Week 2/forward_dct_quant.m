function Output = forward_dct_quant(Input, QP, Q_matrix)
    % Perform 2D forward DCT on the input, with the in-built MATLAB function as I was unable to complete Lab #2
    T = dct2(Input);
    % Perform quantization on T, which holds the DCT coefficient matrix, given the formula found in the lab prep document
    Output = round(T./(QP.*Q_matrix));
end