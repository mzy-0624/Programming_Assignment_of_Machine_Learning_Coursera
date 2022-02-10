function [theta] = trainLinearReg(X, y, lambda)
    initial_theta = zeros(size(X, 2), 1);                       % Initialize Theta
    costFunction = @(t)linearRegCostFunction(X, y, t, lambda); % Create "short hand" for the cost function to be minimized
    options = optimset('MaxIter', 200, 'GradObj', 'on');        % Now, costFunction is a function that takes in only one argument
    theta = fmincg(costFunction, initial_theta, options);       % Minimize using fmincg
end
