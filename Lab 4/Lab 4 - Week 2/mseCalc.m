% Mean Squared Error (MSE) Function
function mseValue = mseCalc(P, Q)
    % Converting to double for accurate manipulation
    P = double(P);
    Q = double(Q);

    % Formula implementation
    mseValue = mean((P - Q).^2, 'all');
end
  