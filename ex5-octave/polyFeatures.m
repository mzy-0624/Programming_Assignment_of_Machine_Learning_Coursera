function [X_poly] = polyFeatures(X, p)
    X_poly = zeros(numel(X), p);
    X_poly(:, 1) = X;
    for i = 2 : p
        X_poly(:, i) = X_poly(:, i - 1) .* X;
    end
end
