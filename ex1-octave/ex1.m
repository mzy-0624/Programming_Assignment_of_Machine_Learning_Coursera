clear; 
close all;
clc
%% ==================== Part 1: Basic Function ====================
fprintf('Running warmUpExercise ... \n');
fprintf('5x5 Identity Matrix: \n');
warmUpExercise()
fprintf('Program paused. Press enter to continue.\n');
pause;
%% ======================= Part 2: Plotting =======================
fprintf('Plotting Data ...\n')
data = load('ex1data1.txt');
X = data(:, 1); 
y = data(:, 2);
m = length(y);
plotData(X, y);
fprintf('Program paused. Press enter to continue.\n');
pause;
%% =================== Part 3: Cost and Gradient descent ===================
X = [ones(m, 1), data(:, 1)];
theta = zeros(2, 1);
iterations = 1500;
alpha = 0.01;
fprintf('\nTesting the cost function ...\n')
J = computeCost(X, y, theta);
fprintf('With theta = [0; 0]\nCost computed = %.2f\n', J);
fprintf('Expected cost value (approx) 32.07\n');
J = computeCost(X, y, [-1; 2]);
fprintf('\nWith theta = [-1; 2]\nCost computed = %.2f\n', J);
fprintf('Expected cost value (approx) 54.24\n');
fprintf('Program paused. Press enter to continue.\n');
pause;
fprintf('\nRunning Gradient Descent ...\n')
theta = gradientDescent(X, y, theta, alpha, iterations);
fprintf('Theta found by gradient descent:\n');
fprintf(' %.4f\n', theta);
fprintf('Expected theta values (approx)\n');
fprintf(' -3.6303\n  1.1664\n\n');
hold on;
plot(X(:, 2), X * theta, '-')
legend('Training data', 'Linear regression')
hold off;
predict1 = [1, 3.5] * theta;
fprintf('For population = 35,000, we predict a profit of %f\n', predict1 * 10000);
predict2 = [1, 7] * theta;
fprintf('For population = 70,000, we predict a profit of %f\n', predict2 * 10000);
fprintf('Program paused. Press enter to continue.\n');
pause;
%% ============= Part 4: Visualizing J(theta_0, theta_1) =============
fprintf('Visualizing J(theta_0, theta_1) ...\n')
theta0_vals = linspace(-10, 10, 100);
theta1_vals = linspace(-1, 4, 100);
J_vals = zeros(length(theta0_vals), length(theta1_vals));
for i = 1 : length(theta0_vals)
    for j = 1 : length(theta1_vals)
	    t = [theta0_vals(i); theta1_vals(j)];
	    J_vals(i, j) = computeCost(X, y, t);
    end
end
J_vals = J_vals';
figure;
surf(theta0_vals, theta1_vals, J_vals)
xlabel('\theta_0'); ylabel('\theta_1');
figure;
contour(theta0_vals, theta1_vals, J_vals, logspace(-2, 3, 20))
xlabel('\theta_0'); ylabel('\theta_1');
hold on;
plot(theta(1), theta(2), 'rx', 'MarkerSize', 10, 'LineWidth', 2);