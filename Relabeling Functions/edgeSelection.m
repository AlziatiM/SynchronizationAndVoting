function pos = edgeSelection(M,perc)
l = 1:M*M;
count = M+1;
b = 1:+count:M*M;

l(b) = [];

E = floor((M*(M-1)/2)*perc);
adj = spalloc(M, M, E);
i = randperm(M*(M-1));

idx = l(:, i);

adj(idx(1:E)) = 1;
[i,j,~] = find(adj);

pos = [i,j];

 unEdg = unique(pos(:,1));
missing = setdiff( 1:M, unEdg);

if ~isempty(missing)

 for i = 1: size(missing,2) 
    pos = [pos; [missing(1,i), datasample([1:i-1,i+1:M],1)]];
 end
end

end

