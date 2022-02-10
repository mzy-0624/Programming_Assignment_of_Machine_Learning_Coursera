%% Initialization
clear; 
close all; 
clc
%% ================= Part 1: Find Closest Centroids ====================
fprintf('Finding closest centroids.\n\n');
load('ex7data2.mat');   % Load an example dataset that we will be using
% Select an initial set of centroids
K = 3; % 3 Centroids
initial_centroids = [3 3; 6 2; 8 5];
% Find the closest centroids for the examples using the initial_centroids
idx = findClosestCentroids(X, initial_centroids);
fprintf('Closest centroids for the first 3 examples: \n')
fprintf(' %d', idx(1: 3));
fprintf('\n(the closest centroids should be 1, 3, 2 respectively)\n');
fprintf('Program paused. Press enter to continue.\n');
pause;
%% ===================== Part 2: Compute Means =========================
fprintf('\nComputing centroids means.\n\n');
centroids = computeCentroids(X, idx, K);    % Compute means based on the closest centroids found in the previous part.
fprintf('Centroids computed after initial finding of closest centroids: \n')
fprintf(' %f %f \n' , centroids');
fprintf('\n(the centroids should be\n');
fprintf('   [ 2.428301 3.157924 ]\n');
fprintf('   [ 5.813503 2.633656 ]\n');
fprintf('   [ 7.119387 3.616684 ]\n\n');
fprintf('Program paused. Press enter to continue.\n');
pause;
%% =================== Part 3: K-Means Clustering ======================
fprintf('\nRunning K-Means clustering on example dataset.\n\n');
load('ex7data2.mat');   % Load an example dataset
% Settings for running K-Means
K = 3;
max_iters = 10;
% initial_centroids = [3 3; 6 2; 8 5];
initial_centroids = kMeansInitCentroids(X, K);
% Run K-Means algorithm. The 'true' at the end tells our function to plot the progress of K-Means
[centroids, idx] = runkMeans(X, initial_centroids, max_iters, true);
fprintf('\nK-Means Done.\n\n');
fprintf('Program paused. Press enter to continue.\n');
pause;
%% ============= Part 4: K-Means Clustering on Pixels ===============
fprintf('\nRunning K-Means clustering on pixels from an image.\n\n');
A = double(imread('bird_small.png'));   %  Load an image of a bird
A = A / 255; % Divide by 255 so that all values are in the range 0 - 1
img_size = size(A); % Size of the image
X = reshape(A, img_size(1) * img_size(2), 3);
% You should try different values of K and max_iters here
K = 16;
max_iters = 10;
initial_centroids = kMeansInitCentroids(X, K);
[centroids, idx] = runkMeans(X, initial_centroids, max_iters);  % Run K-Means
fprintf('Program paused. Press enter to continue.\n');
pause;
%% ================= Part 5: Image Compression ======================
fprintf('\nApplying K-Means to compress an image.\n\n');
% Find closest cluster members
idx = findClosestCentroids(X, centroids);
% Essentially, now we have represented the image X as in terms of the indices in idx. 
% We can now recover the image from the indices (idx) by mapping each pixel (specified
% by its index in idx) to the centroid value
X_recovered = centroids(idx,:);
% Reshape the recovered image into proper dimensions
X_recovered = reshape(X_recovered, img_size(1), img_size(2), 3);
% Display the original image 
subplot(1, 2, 1);
imagesc(A); 
title('Original');
% Display compressed image side by side
subplot(1, 2, 2);
imagesc(X_recovered)
title(sprintf('Compressed, with %d colors.', K));
fprintf('Program paused. Press enter to continue.\n');
pause;