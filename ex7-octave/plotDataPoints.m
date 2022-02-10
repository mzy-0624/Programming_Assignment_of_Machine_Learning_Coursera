function plotDataPoints(X, idx, K)
    % Create palette
    palette = hsv(K + 1);
    colors = palette(idx, :);
    scatter(X(:, 1), X(:, 2), 15, colors);  % Plot the data
end
