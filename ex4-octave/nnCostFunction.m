function [J grad] = nnCostFunction(nn_params, input_layer_size, hidden_layer_size, num_labels, X, y, lambda)
    Theta1 = reshape(nn_params(1 : hidden_layer_size * (input_layer_size + 1)), hidden_layer_size, input_layer_size + 1);
    Theta2 = reshape(nn_params(1 + hidden_layer_size * (input_layer_size + 1) : end), num_labels, hidden_layer_size + 1);
    m = size(X, 1);
    y = eye(num_labels)(y, :);
    a1 = [ones(m, 1) X];
    z2 = a1 * Theta1';
    a2 = [ones(m, 1) sigmoid(z2)];
    z3 = a2 * Theta2';
    a3 = h = sigmoid(z3);
    J = -sum(sum(y .* log(h) + (1 - y) .* log(1 - h))) / m;
    J = J + lambda / (2 * m) * (sum(sum(Theta1 .^ 2)(2 : end)) + sum(sum(Theta2 .^ 2)(2 : end)));
    delta3 = a3 - y;
    delta2 = (delta3 * Theta2)(:, 2 : end) .* sigmoidGradient(z2);
    Theta1_grad = (delta2' * a1 + lambda * [zeros(hidden_layer_size, 1) Theta1(:, 2 : end)]) / m;
    Theta2_grad = (delta3' * a2 + lambda * [zeros(num_labels, 1)        Theta2(:, 2 : end)]) / m;
    grad = [Theta1_grad(:); Theta2_grad(:)];
end