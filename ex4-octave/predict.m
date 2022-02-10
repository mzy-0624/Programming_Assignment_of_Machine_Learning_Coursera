function p = predict(Theta1, Theta2, X)
    m = size(X, 1);
    a1 = [ones(m, 1) X];
    a2 = [ones(m, 1) sigmoid(a1 * Theta1')];
    a3 = sigmoid(a2 * Theta2');
    [c, p] = max(a3, [], 2);
end