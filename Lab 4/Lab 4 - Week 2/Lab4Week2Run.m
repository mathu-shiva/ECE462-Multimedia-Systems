% Loading the sequence.mat file
sequence = load('sequence.mat');

% Loading the Q_matrices.mat file
Q_matrices = load('Q_matrices.mat');

% Extracting the necessary functions
Qintra = Q_matrices.Q_intra;
Qinter = Q_matrices.Q_inter;
sequence = sequence.sequence;

% Setting variables
QP = 2;
numFrames = size(sequence, 3);
sequence = double(sequence);

%--------------------------- SCRIPT FOR IPIPIP ---------------------------%

% Initializing the output to have the correct dimensions
IPoutput = zeros(288, 352, 30);

% Initializing the first reference frame to be the first frame of input sequence
referenceFrame = sequence(:, :, 1);

% Looping through the total number of frames, ie. 30
for i = 1:numFrames
    % If the frame index is odd, we conduct I-encoding
    if mod(i, 2) == 1
        % I-encoding where we pass in whichever odd-index sequence frame the iteration is on
        IPoutput(:, :, i) = Iencoder(sequence(:, :, i), QP, Qintra);
    % If the frame index is even, we conduct P-encoding
    else
        % Resetting reference frame to be the previously encoded frame
        referenceFrame = IPoutput(:, :, i - 1);
        % P-encoding where we pass in the reference frame and whichever even-index sequence frame the iteration is on
        IPoutput(:, :, i) = Pencoder(referenceFrame, sequence(:, :, i), QP, Qintra, Qinter);
    end
end

% Playing the reconstructed sequence
play_frames(IPoutput, 5);

% Running a sequential motion search on the last frame and displaying the motion vectors
[predictedIP, motionVectorsIP, flagIP] = Sequential_MotionSearch(sequence(:, :, end), IPoutput(:, :, end));
show_mv(motionVectorsIP);
title('Motion Vectors of IPIPIP Sequence');

% Calculating and displaying the PSNR of the reconstructed picture
ipPSNR = psnrCalc(sequence(:, :, end), IPoutput(:, :, end));
disp(['The PSNR of the IPIPIP sequence reconstructed picture is: ' num2str(ipPSNR)]);

%--------------------------- SCRIPT FOR IPPPPP ---------------------------%

% Initializing the output to have the correct dimensions
PPoutput = zeros(288, 352, 30);

% Initializing the first reference frame to be the first frame of input sequence
referenceFrame = sequence(:, :, 1);

% Looping through the total number of frames, ie. 30
for i = 1:numFrames
    % If the remainder is 1, this indicates that the current frame is the first of a set of 6 frames, thus we perform I-encoding
    if mod(i, 6) == 1
        % I-encoding where we pass in the 1st of each set of 6 frames
        PPoutput(:, :, i) = Iencoder(sequence(:, :, i), QP, Qintra);
    % If the remainder is anything else, this indicates that the current frame is one of the other 5 frames of the set of 6, thus we perform P-encoding
    else
        referenceFrame = PPoutput(:, :, i - 1);
        % P-encoding where we pass in the 2nd to 6th of each set of 6 frames and the reference frame
        PPoutput(:, :, i) = Pencoder(referenceFrame, sequence(:, :, i), QP, Qintra, Qinter);
    end
end

% Playing the reconstructed sequence
play_frames(PPoutput, 5);

% Running a sequential motion search on the last frame and displaying the motion vectors
[predictedPP, motionVectorsPP, flagPP] = Sequential_MotionSearch(sequence(:, :, end), PPoutput(:, :, end));
show_mv(motionVectorsPP);
title('Motion Vectors of IPPPPP Sequence');

% Calculating and displaying the PSNR of the reconstructed picture
ppPSNR = psnrCalc(sequence(:, :, end), PPoutput(:, :, end));
disp(['The PSNR of the IPPPPP sequence reconstructed picture is: ' num2str(ppPSNR)]);


