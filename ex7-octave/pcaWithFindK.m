%% This is my own function
function [U, S, K] = pcaWithFindK(X)
    [m, n] = size(X);
    % Feature normalize (completed)
    Sigma = 1 / m * X' * X;
    [U, S, V] = svd(Sigma);
    K = 0;
    numerator = 0;
    denominator = sum(sum(S));
    for k = 1 : n
        numerator = numerator + S(k, k);
        if numerator / denominator >= 0.99
            K = k;
            break;
        end
    end
    fprintf("K = %d\n", K);
end