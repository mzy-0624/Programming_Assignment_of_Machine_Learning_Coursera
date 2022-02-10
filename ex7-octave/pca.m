function [U, S] = pca(X)
    [m, n] = size(X);
    % Feature normalize (completed)
    Sigma = 1 / m * X' * X;
    [U, S, V] = svd(Sigma);
end
