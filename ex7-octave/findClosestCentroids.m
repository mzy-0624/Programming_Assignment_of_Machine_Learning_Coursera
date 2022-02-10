function idx = findClosestCentroids(X, centroids)
    K = size(centroids, 1);
    m = size(X, 1);
    idx = zeros(m, 1);
    for i = 1 : m
        d = zeros(K, 1);
        for k = 1 : K
            d(k) = distance2(X(i, :), centroids(k, :));
        end
        [value, idx(i)] = min(d, [], 1);
    end

end
function d2 = distance2(x1, x2)
    % x1, x2: 1xn
    d2 = (x1 - x2) * (x1 - x2)';
end