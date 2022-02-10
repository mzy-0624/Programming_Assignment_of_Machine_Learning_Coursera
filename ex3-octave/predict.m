function p = predict(Theta1, Theta2, X)
    m = size(X, 1);
    a1 = [ones(m, 1) X];                        % input  layer
    a2 = [ones(m, 1) sigmoid(a1 * Theta1')];    % hidden layer
    a3 = sigmoid(a2 * Theta2');                 % output layer
    [c, p] = max(a3, [], 2);
end