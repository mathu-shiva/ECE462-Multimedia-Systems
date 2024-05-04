% Signal-to-Noise Ratio (SNR) Function
function snrValue = snrCalc(P, Q)
    % Converting to double for accurate manipulation
    P = double(P);
    Q = double(Q);

    % Formula implementation
    mseValue = mseCalc(P, Q);
    snrValue = 10*log10((mean(P.^2, 'all'))/mseValue);
end