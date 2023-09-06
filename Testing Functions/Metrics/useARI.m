function ARI = useARI(varargin)

%USEARI measures the Adjusted Rand Index between two partitions A and B


    [A_labels, B_labels] = varargin{1:2};

% if size(varargin) < 3
% 
% 
%     N = size(pi_A,1);
%     A_labels = zeros(N,1);
%     B_labels = zeros(N,1);
%     for i=1:N
%         A_labels(i) = label(i,pi_A);
%         B_labels(i) = label(i,pi_B);
%     end
% else
% 
% 
%     [partitionIndexA, partitionIndexB, PI, N] = varargin{1:4};
%     A_labels = zeros(N,1);
%     B_labels = zeros(N,1);
%     for i=1:N
%         A_labels(i) = label(i,partitionIndexA, PI);
%         B_labels(i) = label(i,partitionIndexB, PI);
%     end
% end

ARI = RandIndexFS(A_labels,B_labels);

end

