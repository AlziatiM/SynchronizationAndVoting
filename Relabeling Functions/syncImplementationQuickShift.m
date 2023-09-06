function [T_out, U] = syncImplementationQuickShift(PI,PI_LM, perc, simpleSync, trueK)
M = size(PI,1);
[nr,nc] = cellfun(@size,PI);

 T_in = zeros(sum(nc));
T_in = mat2cell(T_in, nc, nc);


if ~simpleSync
l = [1:M*M];
count = M+1;
b = [1:+count:M*M];

l(b) = [];

E = floor((M*(M-1)/2)*perc);
adj = spalloc(M, M, E);
i = randperm(M*(M-1));

idx = l(:, i);

adj(idx(1:E)) = 1;
[i,j,~] = find(adj);

pos = [i,j];

 unEdg = unique(pos(:,1));
missing = setdiff( [1:M], unEdg);
if ~isempty(missing)

 for i = 1: size(missing,2) 
    pos = [pos; [missing(1,i), datasample([[1:i-1],[i+1:M]],1)]];
 end
end
else
   pos = [ones(M-1,1), [2:M]'] ;
end
for i=1:size(pos,1)
        r = pos(i,1);
        c = pos(i,2);
        [~, relabeling] = relabel(PI{c},PI_LM(c,:)' ,PI{r},PI_LM(r,:)', "Partial");
%         permMat = permutationConversion(relabeling);
        permMat = relabeling;

        T_in{r,c} = permMat;
        T_in{c,r} = permMat';


end

T_mat = cell2mat(T_in)+eye(sum(nc));

%%%%%%%%%%%%%%%%%%
dim  = nc;
cumDim = [0;cumsum(dim(1:end-1))];
m = sum(dim);
Z_pairwise = T_mat;
ncams=M;
membershipPrior=zeros(1,m); % image membership
        for k=1:ncams
            membershipPrior(1+cumDim(k):cumDim(k)+dim(k))=k;
        end
        % Compute tracks (the number of tracks is automatically recovered)
        [membershipCorrespondences,info]=quickshift_matching(Z_pairwise,membershipPrior,'similarity');

        tracks_quickMatch=max(membershipCorrespondences); % Number of tracks
        % Convert tracks into permutation matrices
        P_out=sparse(1:m,membershipCorrespondences,1,m,tracks_quickMatch);
 
U= mat2cell(P_out, nc);
T_out= [];


