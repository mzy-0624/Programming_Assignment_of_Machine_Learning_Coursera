function centroids = kMeansInitCentroids(X, K)
    % centroids = KMEANSINITCENTROIDS(X, K) returns K initial centroids to be used with the K-Means on the dataset X
    % Initialize the centroids to be random examples
    randidx = randperm(size(X, 1));         % Randomly reorder the indices of examples
    centroids = X(randidx(1 : K), :);       % Take the first K examples as centroids
end