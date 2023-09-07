function voteMatrix = syncVoting(voting,PI, U,pi_ref)
%SYNCVOTING apply a choosen voting mechanism to a globally relabeled
%           ensemble and produce a N x K vote matrix with the cumulative 
%           vote of each partition for each point
% 
%voteMatrix = SYNCVOTING(voting,PI, U,pi_ref)
% 
% 
% INPUTS:
% 
% voting - a string indicating the voting mechanism to utilize. 
% PI - an M x 1 cell array representing the Ensemble. Each cell contains 
%       the Binary Association Matrix of a partition.
% U - an M x 1 cell array containing the global permutation associated to
%       each partition. This is the result of a precedent relabeling
% pi_ref - the BA of the reference partition used in case of weighted voting, if selected. By default is one of the 
%           partitions with the greatest number of cluster labels.
% 
% OUTPUT:
% 
% voteMatrix - a N x K vote matrix with the cumulative vote of each partition for each point
% 


M = size(PI,1);
N = size(PI{1},1);

K_output = size(U{1},2);
V_cell = cell(M,1);


pi_refLV = fromBAtoLV(pi_ref);
PI_LM =EnsembleLabelMatrix(PI);

switch voting
    %no weights are applied
    case 'simple'
        weights = ones(M,1);
    %computed weight wrt a choosen reference using NMI
    case 'weightSimple'
        weights = computeWeights(pi_refLV, PI_LM, 'simple'  );
    %computed weight wrt a choosen reference using inverse of average NMI
%     with all the remaining partitions
    case'weightAverage'
        weights = computeWeights(pi_refLV, PI_LM, 'average'  );
    otherwise
        error('Choosen Voting technique not available')
end

voteMatrix = zeros(N,K_output);

%compute the cumulate votes for each partitions
for i = 1:M
    unweightedVote = PI{i} * U{i,1};
    V_cell{i} = unweightedVote;
    voteMatrix = voteMatrix + weights(i)*unweightedVote;
end


