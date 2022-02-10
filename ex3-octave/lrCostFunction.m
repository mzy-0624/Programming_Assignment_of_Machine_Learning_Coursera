function [J, grad] = lrCostFunction(theta, X, y, lambda)
    m = length(y);
    h = sigmoid(X * theta);
    J = sum(-y .* log(h) - (1 - y) .* log(1 - h)) / m + lambda * sum((theta .^ 2)(2 : end)) / (2 * m);
    grad = X' * (h - y) / m + lambda * [0; theta(2 : end)] / m;
    grad = grad(:); % matrix --> vector
end
