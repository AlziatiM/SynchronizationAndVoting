function weights = computeWeights(pi_refLV,PI_LM, WeightType)

weights = [];

if WeightType == "average"

    for i = 1:size(PI_LM)
        weightVector =  [];
        for j =  1:size(PI_LM)

            if (i ~= j)
                weightVector = [weightVector, nmi(PI_LM(i,:)', PI_LM(j,: )')];
            end
        end

        avgNMI = mean(weightVector);

        weights(i) =  1 / (avgNMI);
%          weights(i) =   avgNMI;

    end
    weights = weights./sum(weights);
else if WeightType == "simple"
   
%         weights(1) = 1;
        for i = 1:size(PI_LM)
            weights(i) = nmi(pi_refLV', PI_LM(i,:)');

        end
end

end
