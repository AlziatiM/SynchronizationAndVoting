function permMatr = relabelEnsemble(relabelingAlgorithmName, PI)
%RELABELENSEMBLE Summary of this function goes here
%   Detailed explanation goes here
M = size(PI,1);
K = size(PI{1}, 2);
permMatr = cell(M,1);
if relabelingAlgorithmName == "Sync"
    [~,sigma] = syncImplementation(PI);
    for i = 1:M
        permMatr{i} = permutationConversion(sigma{i}');
    end
else
    if relabelingAlgorithmName == "Mcla"
        cd ../../ClusterPack-V2.0/;

        [~,globalRelabeling] = mcla(EnsembleLabelMAtrix(PI), K);
        cd ../'Testing Functions'/Iterators/;
        z = 1;
        for i = 1:M
            permMatr{i} = permutationConversion(globalRelabeling(1,z: z+K-1)');
           
            z = z+K;
        end
    else
        pi_reference = PI{1};
        for i=1:M
            pi = PI{i};

            [~, relabelling] = relabel(pi_reference, pi, relabelingAlgorithmName);
            if relabelingAlgorithmName ~= "Regression"

                permMatr{i,1} = permutationConversion(relabelling);

            else
                relabelingBin = matchpairs(-relabelling, 9000, 'min');
                relabelingBin = sortrows(relabelingBin);
                relabelingBin = relabelingBin(:,2);
                permMatrixBin = permutationConversion(relabelingBin);
                permMatr{i,1} = permMatrixBin;

            end
        end
    end
end
