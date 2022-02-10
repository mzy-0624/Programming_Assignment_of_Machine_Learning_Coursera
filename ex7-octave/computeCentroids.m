function centroids = computeCentroids(X, idx, K)
    centroids = zeros(K, size(X, 2));
    for k = 1 : K 
        centroids(k, :) = (X' * (idx == k)) ./ sum(idx == k);
    end
end