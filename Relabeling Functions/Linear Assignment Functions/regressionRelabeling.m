function W = regressionRelabeling(U0,Ui)
%REGRESSIONRELABELING Summary of this function goes here

    W = inv(Ui' * Ui) * Ui' * U0;


end

