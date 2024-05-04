% Peak Signal-to-Noise Ratio (PSNR) Function
function psnrValue = psnrCalc(P, Q)
    % Converting to double for accurate manipulation
    P = double(P);
    Q = double(Q);

    % Formula implementation
    mseValue = mseCalc(P, Q);
    psnrValue = 10*log10((255^2)/mseValue);
end
