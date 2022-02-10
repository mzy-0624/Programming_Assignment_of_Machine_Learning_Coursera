function [mu sigma2] = estimateGaussian(X)
	[m, n] = size(X);
	mu = mean(X);
	sigma2 = var(X) * (m - 1) / m;
end
