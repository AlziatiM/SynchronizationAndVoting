function edgesIdx = edgeSelection(M,perc)
availableEdges = 1:M*M;
count = M+1;
b = 1:+count:M*M;

availableEdges(b) = [];

numEdges = floor((M*(M-1)/2)*perc);
adj = spalloc(M, M, numEdges);
randomPerm = randperm(M*(M-1));

shuffledEdges = availableEdges(:, randomPerm);

adj(shuffledEdges(1:numEdges)) = 1;
[i,j,~] = find(adj);

edgesIdx = [i,j];

 unEdg = unique(edgesIdx(:,1));
missing = setdiff( 1:M, unEdg);



if ~isempty(missing)
 
 for i = 1: size(missing,2) 
    edgesIdx = [edgesIdx; [missing(1,i), datasample([1:i-1,i+1:M],1)]];
 end
    disp('Not enough edges are present in the permutation Graph. Required edges are added.')
    update = ['Old percentage: ', num2str(perc),'   New percentage: ', num2str(size(edgesIdx,1)/(M*(M-1)/2)) ];
    disp(update)


end

end

