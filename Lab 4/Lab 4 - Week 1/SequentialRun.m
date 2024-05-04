% Reading in the provided reference image
referenceImage = imread('lab4_wk1_p0101_ref.pgm');
% Reading in the provided target image
targetImage = imread('lab4_wk1_p0101_tgt.pgm');

% Calling Sequential MotionSearch function
[Prediction, MotionVectors, Flag] = Sequential_MotionSearch(targetImage, referenceImage);

% Calling the show_mv.m function to display the motion vectors
show_mv(MotionVectors);
title('Motion Vectors - Sequential Motion Search');

% Finding the residual image as given in the lab document
residualImage = double(targetImage) - double(Prediction);

% Displaying the found residual image
figure;
imagesc(residualImage);
colormap(gray);
title('Residual Image - Sequential Motion Search');

% Displaying the prediction image
figure;
imagesc(Prediction);
colormap(gray);
title('Prediction Image - Sequential Motion Search');

MSE = immse(double(Prediction), double(targetImage));
disp(['MSE for Sequential Motion Search: ', num2str(MSE)]);