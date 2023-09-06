function [T_out, sigma] = syncImplementationPachauri(PI,PI_LM, perc, simpleSync, K)
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

[u,s,v] = svd(T_mat);
ev = diag(s);
%  figure, plot(ev,'+')

% Collecting top-n left singular vectors S
U = u(:,1:K);
P = cell(M);
sigma = cell(M,1);
for i = 1 : M
    P_res = U((i-1)*K+1:i*K,1:K)*U(1:K,1:K)';
    P{i,1} = P_res;
    sigma{i,1} = permutationConversion(munkres(-P_res)');
end

T_out = [];

% for i=1:M
%     for j=1:M
%         T_out{i,j} = permutationConversion(sigma{i,1}') * inv(permutationConversion(sigma{j,1}'));
%     end
% end



