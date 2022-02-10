function [lambda_vec, error_train, error_val] = validationCurve(X, y, Xval, yval)
    lambda_vec = [0 0.001 0.003 0.01 0.03 0.1 0.3 1 3 10]';
    lenLambda = length(lambda_vec);
    error_train = zeros(lenLambda, 1);
    error_val   = zeros(lenLambda, 1);
    for i = 1 : lenLambda
        lambda = lambda_vec(i);
        theta = trainLinearReg(X, y, lambda);
        error_train(i) = linearRegCostFunction(X, y, theta, 0);         % no lambda
        error_val(i)   = linearRegCostFunction(Xval, yval, theta, 0);   % no lambda
    end
end