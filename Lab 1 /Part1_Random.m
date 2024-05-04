% Creating a random 256x256 image using "randi" to determine the range
% Parameters = (interval, width, length, colour channels)
randomImage = randi([0, 255], 256, 256, 3);

% Displaying the randomly created image
figure();
randomImage = uint8(randomImage);
image(randomImage);
title('Randomly Coloured Image');
axis image;

% Finding the mean of the each colour component
redAverage = mean(randomImage(:, :, 1), 'all');         % Red colour channel
greenAverage = mean(randomImage(:, :, 2), 'all');       % Green colour channel
blueAverage = mean(randomImage(:, :, 3), 'all');        % Blue colour channel

% Finding all pixels where intensity exceeds corresponding average
% "Find" operator returns a vector of the values where expression is true
highRed = find(randomImage(:, :, 1) > redAverage);
highGreen = find(randomImage(:, :, 2) > greenAverage);
highBlue = find(randomImage(:, :, 3) > blueAverage);

% Vector indexing to replace the higher intensity pixels with the average intensity
randomImage(highRed) = redAverage;
randomImage(highGreen) = greenAverage;
randomImage(highBlue) = blueAverage;

% Displaying the newly updated image
figure();
randomImage = uint8(randomImage);
image(randomImage);
title('Averaged Out Image')
axis image;

