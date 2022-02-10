function [C, sigma] = dataset3Params(X, y, Xval, yval)
%   v = [0.01 0.03 0.1 0.3 1 3 10 30];
	v = [0.01 0.03 0.1 0.3 1 3];
    C = Inf;        % C = 1;
    sigma = Inf;    % sigma = 0.1;
    minError = Inf;
    for i = 1 : length(v)
        for j = 1 : length(v)
            model = svmTrain(X, y, v(i), @(x1, x2)gaussianKernel(x1, x2, v(j)));
            predictions = svmPredict(model, Xval);
            Error = mean(double(predictions ~= yval));
            if (Error < minError)
                minError = Error;
                C = v(i);
                sigma = v(j);
            end
        end
    end
end
