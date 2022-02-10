%% Initialization
clear; 
close all; 
clc

%% ================== Part 1: Load Example Dataset  ===================
fprintf('Visualizing example dataset for outlier detection.\n\n');
load('ex8data1.mat');   % Load the dataset. You should now have the variables X, Xval, yval in your environment.
%  Visualize the example dataset
plot(X(:, 1), X(:, 2), 'bx');
axis([0 30 0 30]);
xlabel('Latency (ms)');
ylabel('Throughput (mb/s)');
fprintf('Program paused. Press enter to continue.\n');
pause
%% ================== Part 2: Estimate the dataset statistics ===================
fprintf('Visualizing Gaussian fit.\n\n');
[mu sigma2] = estimateGaussian(X);          % Estimate my and sigma2
p = multivariateGaussian(X, mu, sigma2);    % Returns the density of the multivariate normal at each data point (row) of X
visualizeFit(X, mu, sigma2);                % Visualize the fit
xlabel('Latency (ms)');
ylabel('Throughput (mb/s)');
fprintf('Program paused. Press enter to continue.\n');
pause;
%% ================== Part 3: Find Outliers ===================
%  Now you will find a good epsilon threshold using a cross-validation set probabilities given the estimated Gaussian distribution
pval = multivariateGaussian(Xval, mu, sigma2);
[epsilon F1] = selectThreshold(yval, pval);
fprintf('Best epsilon found using cross-validation: %e\n', epsilon);
fprintf('Best F1 on Cross Validation Set:  %f\n', F1);
fprintf('   (you should see a value epsilon of about 8.99e-05)\n');
fprintf('   (you should see a Best F1 value of  0.875000)\n\n');
%  Find the outliers in the training set and plot the
outliers = find(p < epsilon);
%  Draw a red circle around those outliers
hold on
plot(X(outliers, 1), X(outliers, 2), 'ro', 'LineWidth', 2, 'MarkerSize', 10);
hold off
fprintf('Program paused. Press enter to continue.\n');
pause;
%% ================== Part 4: Multidimensional Outliers ===================
%  We will now use the code from the previous part and apply it to a 
%  harder problem in which more features describe each datapoint and only 
%  some features indicate whether a point is an outlier.
%

load('ex8data2.mat');                           % Loads the second dataset. You should now have the variables X, Xval, yval in your environment
[mu sigma2] = estimateGaussian(X);              % Apply the same steps to the larger dataset
p = multivariateGaussian(X, mu, sigma2);        % Training set 
pval = multivariateGaussian(Xval, mu, sigma2);  % Cross-validation set
[epsilon F1] = selectThreshold(yval, pval);     % Find the best threshold
fprintf('Best epsilon found using cross-validation: %e\n', epsilon);
fprintf('Best F1 on Cross Validation Set:  %f\n', F1);
fprintf('   (you should see a value epsilon of about 1.38e-18)\n');
fprintf('   (you should see a Best F1 value of 0.615385)\n');
fprintf('# Outliers found: %d\n\n', sum(p < epsilon));