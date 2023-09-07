function  syncedU = SV_QM(PI, perc, trueK)
% SV_QM apply the synchronization and voting algorithm on a cluster
%        ensemble by employing the QuickMatch algorithm
% 
% syncedU = SV_QM(PI, perc, trueK)
% 
% INPUTS:
% 
% PI - an M x 1 cell array representing the Ensemble. Each cell contains 
%       the Binary Association Matrix of a partition.
% perc - percentage of edges created with the graph, from 0.0 to 1.0. Values
%           too low are automatically handled, creating the minimum number 
%           of edges required for a fully-connected graph
% trueK - the number of clusters of the ground truth. Some methods don't
%           require it, in that case any integer value can be inserted. For
%           the QuickMatch algorithm it is not required since it is
%           automatically estimated 
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

% % find the vector of synchronized permutations U via QuickMatch. This
% algorithm was taken from the implementation of Tron et al.
% https://sites.bu.edu/tron/2018/07/13/fast-multi-image-matching-via-density-based-clustering-quickmatch/
%%%%%%%%%%%%%%%%%%
dim  = Kvector;
cumDim = [0;cumsum(dim(1:end-1))];
m = sum(dim);
Z_pairwise = PermGlobal_IN;
ncams=M;
membershipPrior=zeros(1,m); % image membership
for k=1:ncams
    membershipPrior(1+cumDim(k):cumDim(k)+dim(k))=k;
end
% Compute tracks (the number of tracks is automatically recovered)
[membershipCorrespondences,~]=quickshift_matching(Z_pairwise,membershipPrior,'similarity');

tracks_quickMatch=max(membershipCorrespondences); % Number of tracks
% Convert tracks into permutation matrices
U=sparse(1:m,membershipCorrespondences,1,m,tracks_quickMatch);

syncedU= mat2cell(U, Kvector);


