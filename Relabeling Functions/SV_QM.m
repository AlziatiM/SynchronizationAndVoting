function  syncedU = SV_QM(PI, perc, trueK)
M = size(PI,1);

[~,Kvector] = cellfun(@size,PI);

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


