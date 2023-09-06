function W = createContingencyGraph(pi_ALV, pi_BLV)
% CREATECONTINGENCYGRAPH this function creates the weighted contingency
% matrix of the weighted bipartite graph between the cluster labels of two partitions, to solve the relabeling problem
%
%
% W = createContingencyGraph(PI_A, PI_B) returns W,
% the resulting weighted bipartite contingency graph, created from
% assigning a weight that connects each cluster from the partition PI_A to
% each cluster of the partition PI_B by seeing how many data point have
% been assigned in common to the two clusters.
%

assert(size(pi_ALV, 1) == size(pi_BLV, 1), "Partitions on different number of data points")

N = size(pi_ALV, 1);

K = max(max(pi_ALV), max(pi_BLV));
W = zeros(K,K);

% for i=1:size(W,1)
%     for j=1:size(W,2)
%         for k=1:N
%             if (pi_A(k, i) == 1) && (pi_B(k, j) == 1)
%                 W(i,j) = W(i,j) - 1;
%             end
%         end
% 
% 
%     end
% end


        for k=1:N
            
           W(pi_ALV(k),pi_BLV(k)) = W(pi_ALV(k),pi_BLV(k)) - 1;
            
        end


    


end