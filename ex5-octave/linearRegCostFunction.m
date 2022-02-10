function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
    m = length(y);
    h = X * theta;
    J = sum((h - y) .^ 2) / (2 * m) + lambda * sum((theta .^ 2)(2 : end)) / (2 * m);
    grad = X' * (h - y) / m + lambda * [0; theta(2 : end)] / m;
    grad = grad(:); % matrix --> vector
end