function  syncedU = SV_NMF(PI, perc, trueK)
% SV_NMF apply the synchronization and voting algorithm on a cluster
%        ensemble by applying a non-negative matrix factorization
% 
% syncedU = SV_NMF(PI, perc, trueK)
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
% syncedU - an M x 1 cell array which represents the absolute permutations block vector U


M = size(PI,1);

[~,Kvector] = cellfun(@size,PI);

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

% % find the vector of synchronized permutations U via non-negative matrix
% factorization. This algorithm was taken from the implementation of
% Bernard et al.
% https://github.com/fbernardpi/NmfSync

[~, syncedU] = nmfSync(PermGlobal_IN, Kvector, trueK);


syncedU = mat2cell(full(syncedU),Kvector);






