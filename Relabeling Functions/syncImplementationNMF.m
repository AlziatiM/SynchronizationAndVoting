function  syncedP = syncImplementationNMF(PI, perc, trueK)

M = size(PI,1);
PI_LM = EnsembleLabelMAtrix(PI);

[~,Kvector] = cellfun(@size,PI);

PermGlobalMatrix = zeros(sum(Kvector));
PermGlobal = mat2cell(PermGlobalMatrix, Kvector, Kvector);



%selezioni degli archi da non utilizzare
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






for i=1:size(pos,1)
        r = pos(i,1);
        c = pos(i,2);
        [~, relabeling] = relabelPartial(PI{c}, PI{r});
        permMat = relabeling;

        PermGlobal{r,c} = permMat;
        PermGlobal{c,r} = permMat';


end

T_mat = cell2mat(PermGlobal)+eye(sum(Kvector));



[~, syncedP] = nmfSync(T_mat, Kvector, trueK);
if(size(full(syncedP),2)~= trueK)
    sas = 1;
end


syncedP = mat2cell(full(syncedP),Kvector);






