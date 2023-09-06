function  syncedU = SV_EIG(PI, perc, trueK)
M = size(PI,1);

[~,Kvector] = cellfun(@size,PI);

if(sum(Kvector)~= M*trueK)
            error('SV-EIG does not support a variable number of cluster labels in the Ensemble.');
end

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



[u,~,~] = svd(PermGlobal_IN);

% Collecting top-n left singular vectors S
U = u(:,1:trueK);
syncedU = cell(M,1);

for i = 1 : M
    P_res = U((i-1)*trueK+1:i*trueK,1:trueK)*U(1:trueK,1:trueK)';
    syncedU{i,1} = permutationConversion(munkres(-P_res)');
end




