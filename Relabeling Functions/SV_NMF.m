function  syncedU = SV_NMF(PI, perc, trueK)

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



[~, syncedU] = nmfSync(PermGlobal_IN, Kvector, trueK);


syncedU = mat2cell(full(syncedU),Kvector);






