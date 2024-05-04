% ----------------------------- Question 2 ----------------------------- %

% Reading in the original and corrupted images
originalBeans = imread("jbeans-1.ppm");
corruptedBeans = imread("jbeans_corrupted_sample.ppm");

% Calling the image metric functions and passing in the two images
mseBeans = mseCalc(originalBeans, corruptedBeans);
psnrBeans = psnrCalc(originalBeans, corruptedBeans);
snrBeans = snrCalc(originalBeans, corruptedBeans);

% Displaying the returned results from the three image metric functions
disp("Calculated MSE value is " + mseBeans + ".");
disp("Calculated PSNR value is " + psnrBeans + ".");
disp("Calculated SNR value is " + snrBeans + ".");

% ----------------------------- Question 3 ----------------------------- %

% Converting original image to the YCbCr colourspace
jbeans_ycc = rgb2ycc(originalBeans);

% Provided values for variance taken from lab document
values = [10^2, 20^2, 40^2, 80^2, 100^2];

% Initializing vectors to store calculated image metrics
mseValuesY = zeros(1, length(values));
psnrValuesY = zeros(1, length(values));
snrValuesY = zeros(1, length(values));

mseValuesCb = zeros(1, length(values));
psnrValuesCb = zeros(1, length(values));
snrValuesCb = zeros(1, length(values));

mseValuesCr = zeros(1, length(values));
psnrValuesCr = zeros(1, length(values));
snrValuesCr = zeros(1, length(values));

% Looping through each variance value
for i = 1:length(values)
    % Square rooting as provided values are squared of the variance
    variance = sqrt(values(i));

    % Generating 256x256 noise image
    randn('state', sum(100*clock));
    noise = variance * randn(256);

    % Adding the generated noise image to each channel separately
    ycc_corrupted_y = noise + jbeans_ycc(:, :, 1);
    ycc_corrupted_Cb = noise + jbeans_ycc(:, :, 2);
    ycc_corrupted_Cr = noise + jbeans_ycc(:, :, 3);

    % Concatenating each corrupted channel with the other respective original channels
    % After concatenating, converting each YCbCr image to RGB
    rgb_corrupted_y = ycc2rgb(cat(3, ycc_corrupted_y, jbeans_ycc(:, :, 2), jbeans_ycc(:, :, 3)));
    rgb_corrupted_Cb = ycc2rgb(cat(3, jbeans_ycc(:, :, 1), ycc_corrupted_Cb, jbeans_ycc(:, :, 3)));
    rgb_corrupted_Cr = ycc2rgb(cat(3, jbeans_ycc(:, :, 1), jbeans_ycc(:, :, 2), ycc_corrupted_Cr));

    % Converting the RGB image from 'double' to 'uint8'
    rgb_corrupted_y = uint8(rgb_corrupted_y);
    rgb_corrupted_Cb = uint8(rgb_corrupted_Cb);
    rgb_corrupted_Cr = uint8(rgb_corrupted_Cr);

    % Calculating MSE, PSNR, and SNR values for the corrupted Y channel
    mse_corrupted_y = mseCalc(originalBeans, rgb_corrupted_y);
    psnr_corrupted_y = psnrCalc(originalBeans, rgb_corrupted_y);
    snr_corrupted_y = snrCalc(originalBeans, rgb_corrupted_y);

    % Calculating MSE, PSNR, and SNR values for the corrupted Cb channel
    mse_corrupted_Cb = mseCalc(originalBeans, rgb_corrupted_Cb);
    psnr_corrupted_Cb = psnrCalc(originalBeans, rgb_corrupted_Cb);
    snr_corrupted_Cb = snrCalc(originalBeans, rgb_corrupted_Cb);

    % Calculating MSE, PSNR, and SNR values for the corrupted Cr channel
    mse_corrupted_Cr = mseCalc(originalBeans, rgb_corrupted_Cr);
    psnr_corrupted_Cr = psnrCalc(originalBeans, rgb_corrupted_Cr);
    snr_corrupted_Cr = snrCalc(originalBeans, rgb_corrupted_Cr);

    % Saving calculated MSE, PSNR, and SNR values for the corrupted Y channel
    mseValuesY(i) = mse_corrupted_y;
    psnrValuesY(i) = psnr_corrupted_y;
    snrValuesY(i) = snr_corrupted_y;

    % Saving calculated MSE, PSNR, and SNR values for the corrupted Cb channel
    mseValuesCb(i) = mse_corrupted_Cb;
    psnrValuesCb(i) = psnr_corrupted_Cb;
    snrValuesCb(i) = snr_corrupted_Cb;

    % Saving calculated MSE, PSNR, and SNR values for the corrupted Cr channel
    mseValuesCr(i) = mse_corrupted_Cr;
    psnrValuesCr(i) = psnr_corrupted_Cr;
    snrValuesCr(i) = snr_corrupted_Cr;

    % Plotting the three image variance = 80 as requested in lab document
    if variance == 80
        % Corrupted Y Channel
        figure();
        image(rgb_corrupted_y);
        title("Jellybeans with Corrupted Y Channel at Variance = 80");
        axis image;

        % Corrupted Cb Channel
        figure();
        image(rgb_corrupted_Cb);
        title("Jellybeans with Corrupted Cb Channel at Variance = 80");
        axis image;

        % Corrupted Cr Channel
        figure();
        image(rgb_corrupted_Cr);
        title("Jellybeans with Corrupted Cr Channel at Variance = 80");
        axis image;
    end
end

% Plotting the MSE values for all channels for each variance
figure();
hold on;
plot(sqrt(values), mseValuesY, 'b-o', "MarkerFaceColor", 'b');
plot(sqrt(values), mseValuesCb, 'r-o', "MarkerFaceColor", 'r');
plot(sqrt(values), mseValuesCr, 'g-o', "MarkerFaceColor", 'g');
hold off;
title("MSE Values vs. Variance");
xlabel("Variance");
ylabel("MSE Values");
legend('Y Channel', 'Cb Channel', 'Cr Channel', 'Location', 'Best');

% Plotting the PSNR values for all channels for each variance
figure();
hold on;
plot(sqrt(values), psnrValuesY, 'b-o', "MarkerFaceColor", 'b');
plot(sqrt(values), psnrValuesCb, 'r-o', "MarkerFaceColor", 'r');
plot(sqrt(values), psnrValuesCr, 'g-o', "MarkerFaceColor", 'g');
hold off;
title("PSNR Values vs. Variance");
xlabel("Variance");
ylabel("PSNR Values");
legend('Y Channel', 'Cb Channel', 'Cr Channel', 'Location', 'Best');

% Plotting the SNR values for all channels for each variance
figure();
hold on;
plot(sqrt(values), snrValuesY, 'b-o', "MarkerFaceColor", 'b');
plot(sqrt(values), snrValuesCb, 'r-o', "MarkerFaceColor", 'r');
plot(sqrt(values), snrValuesCr, 'g-o', "MarkerFaceColor", 'g');
hold off;
title("SNR Values vs. Variance");
xlabel("Variance");
ylabel("DNR Values");
legend('Y Channel', 'Cb Channel', 'Cr Channel', 'Location', 'Best');
