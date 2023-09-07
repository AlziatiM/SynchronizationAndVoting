function  syncedU = SV_EIG(PI, perc, trueK)
% SV_EIG apply the synchronization and voting algorithm on a cluster
%        ensemble by finding the K leading eigenvectors
% 
% syncedU = SV_EIG(PI, perc, trueK)
% 
% INPUTS:
% 
% PI - an M x 1 cell array representing the Ensemble. Each cell contains 
%       the Binary Association Matrix of a partition.
% perc - percentage of edges created with the graph, from 0.0 to 1.0. Values
%           too low are automatically handled, creating the minimum number 
%           of edges required for a fully-connected graph
% trueK - the number of clusters of the ground truth. Some methods don't
%           require it, in that case any integer value can be inserted.
%
% OUTPUT:
% syncedU - the absolute permutations block vector U

M = size(PI,1);

[~,Kvector] = cellfun(@size,PI);

if(sum(Kvector)~= M*trueK)
            error('SV-EIG does not support a variable number of cluster labels in the Ensemble.');
end

% Generate the graph of pairwise permutations with specified percentage of
% edges

PermGlobalMatrix = zeros(sum(Kvector));
PermGlobalCell = mat2cell(PermGlobalMatrix, Kvector, Kvector);

edges = edgeSelection(M,perc);

for i=1:size(edges,1)
        r = edges(i,1);
        c = edges(i,2);
        [~, relabeling] = relabelPartial(PI{c}, PI{r});
        permMat = relabeling;

        PermGlobalCell{r,c} = permMat;
        PermGlobalCell{c,r} = permMat';


end

PermGlobal_IN = cell2mat(PermGlobalCell)+eye(sum(Kvector));


% find the vector of synchronized permutations U 

[u,~,~] = svd(PermGlobal_IN);

% Collecting top-n left singular vectors S
U = u(:,1:trueK);
syncedU = cell(M,1);


% project all found absolute permutations on a reference permutation

for i = 1 : M
    P_res = U((i-1)*trueK+1:i*trueK,1:trueK)*U(1:trueK,1:trueK)';
    syncedU{i,1} = permutationConversion(munkres(-P_res)');
end




