function [bestEpsilon bestF1] = selectThreshold(yval, pval)
    bestEpsilon = bestF1 = F1 = 0;
    stepsize = (max(pval) - min(pval)) / 1000;
    for epsilon = min(pval) : stepsize : max(pval)
        predictions = (pval < epsilon);
        prec = sum(yval & predictions) / sum(predictions);
        rec  = sum(yval & predictions) / sum(yval);
        F1 = 2 * prec * rec / (prec + rec);
        if F1 > bestF1
            bestF1 = F1;
            bestEpsilon = epsilon;
        end
    end
end