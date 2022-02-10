function [error_train, error_val] = learningCurve(X, y, Xval, yval, lambda)
    m = size(X, 1);     % Number of training examples
    error_train = error_val = zeros(m, 1);
    for i = 1 : m
        Xtra = X(1 : i, :);
        ytra = y(1 : i);
        theta = trainLinearReg(Xtra, ytra, lambda);
        error_train(i) = linearRegCostFunction(Xtra, ytra, theta, 0);
        error_val(i)   = linearRegCostFunction(Xval, yval, theta, 0);
    end
end