function [X, BA] = generateGroundTruth(numCluster, pointNumber, interDist)

BA = zeros(pointNumber, numCluster);

%Synthetc data generation implemented and documented by Software Impacts
% https://github.com/SoftwareImpacts/SIMPAC-2020-14
[X, ~, idx] = generateData(pi / 2, pi / 8, numCluster, interDist, interDist, 5, 1, 2, pointNumber);


% figure
% scatter(X(:, 1), X(:, 2), 8, idx);
% hold on

for i=1:pointNumber
    BA(i,idx(i)) = 1; 
end


end

