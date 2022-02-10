function [J, grad] = costFunctionReg(theta, X, y, lambda)
	m = length(y);
	[J, grad] = costFunction(theta, X, y);
	J = J + lambda * sum((theta .^ 2)(2 : end)) / (2 * m);
	grad = grad + lambda * [0; theta(2 : end)] / m;
end