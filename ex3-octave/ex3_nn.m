clear; 
close all; 
clc
input_layer_size  = 400;  % 20x20 Input Images of Digits
hidden_layer_size = 25;   % 25 hidden units
num_labels = 10;          % 10 labels, from 1 to 10  (note that we have mapped "0" to label 10)
%% =========== Part 1: Loading and Visualizing Data =============
fprintf('Loading and Visualizing Data ...\n')
load('ex3data1.mat');
m = size(X, 1);
sel = randperm(m);
sel = sel(1 : 100);
displayData(X(sel, :));
fprintf('Program paused. Press enter to continue.\n');
pause;
%% ================ Part 2: Loading Pameters ================
fprintf('\nLoading Saved Neural Network Parameters ...\n')
load('ex3weights.mat');
%% ================= Part 3: Implement Predict =================
pred = predict(Theta1, Theta2, X);
fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);
fprintf('Program paused. Press enter to continue.\n');
pause;
rp = randperm(m);
for i = 1 : m
	fprintf('\nDisplaying Example Image\n');
	displayData(X(rp(i), :));
	pred = predict(Theta1, Theta2, X(rp(i),:));
	fprintf('\nNeural Network Prediction: %d (digit %d)\n', pred, mod(pred, 10));
	s = input('Paused - press enter to continue, q to exit:', 's');
	if s == 'q'
		break
	end
end