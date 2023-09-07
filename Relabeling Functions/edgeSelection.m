function edgesIdx = edgeSelection(M,perc)
% EDGESELECTION given a number of partitions and a specified percentage,
%               compute a random selection of edges for the graph of
%               pairwise permutations
% 
% edgesIdx = EDGESELECTION(M,perc)
% 
% INPUTS:
% 
% M - number of partitions in the ensemble
%
% perc - percentage of edges created with the graph, from 0.0 to 1.0. Values
%           too low are automatically handled, creating the minimum number 
%           of edges required for a fully-connected graph
%
% OUTPUT:
% edgesIdx - vector containing the pairs of nodes that are connected by an
%            edge in the graph


% from the specified percentage generate a random selection of edges
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

% in the case of insufficient number of edges to generate a connected
% graph, add a minimum number of missing edges
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

