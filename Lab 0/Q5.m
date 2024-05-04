% Vector S with N elements (Here, N = 6)
S = [11, 22, 33, 44, 55, 66];

% To find the even indices, we save every second element of the original
% vector S into S1, starting from the SECOND vector element to the last
S1 = S(2:2:end);       % Even Indices

% To find the odd indices, we save every second element of the original
% vector S into S2, starting from the FIRST vector element to the last
S2 = S(1:2:end);       % Odd Indices

% Printing the result
disp(S1);
disp(S2);