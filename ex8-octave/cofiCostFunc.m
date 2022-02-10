function [J, grad] = cofiCostFunc(params, Y, R, num_users, num_movies, num_features, lambda)
    X = reshape(params(1 : num_movies * num_features), num_movies, num_features);
    Theta = reshape(params(num_movies * num_features + 1 : end), num_users, num_features);
    H = R .* (X * Theta' - Y);
    J = sum(sum(H .^ 2)) / 2 + lambda / 2 * (sum(sum(Theta .^ 2)) + sum(sum(X .^ 2)));
    X_grad = H  * Theta + lambda * X;
    Theta_grad = H' * X + lambda * Theta;
    grad = [X_grad(:); Theta_grad(:)];
end
