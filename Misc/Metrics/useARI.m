function ARI = useARI(varargin)

%USEARI measures the Adjusted Rand Index between two partitions A and B


    [A_labels, B_labels] = varargin{1:2};


ARI = RandIndexFS(A_labels,B_labels);

end

