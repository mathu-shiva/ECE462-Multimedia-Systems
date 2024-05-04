%--------------- Week 1 --------------- %
% Reading in the image
cameraMan = imread("cameraman.png");
% Calling the appropriate Haar transform
transformedImage = HaarL2D(double(cameraMan), 3);
% Displaying the image
disp_dwt(transformedImage, 3);

%--------------- Week 2 --------------- %
