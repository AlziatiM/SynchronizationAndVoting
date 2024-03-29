function consensus = synchronizationAndVoting(method,voting,PI,trueK,perc, pi_ref)
% SYNCHRONIZATIONANDVOTING solve the cluster ensemble problem using one of 
%                          the provided implementations.
% 
% consensus = SYNCHRONIZATIONANDVOTING(method,voting,PI,trueK,perc, pi_ref)
% 
% INPUTS:
% 
% method - the name of the specific synchronization technique that is used 
%           for relabeling. The available options are 'EIG', 'NMF', 'QM'.     
% voting - the name of the specific voting criteria that is used to obtain 
%           the consensus partition. The available options are 'simple', 
%           'weightSimple', 'weightAverage'.
% PI - an M x 1 cell array representing the Ensemble. Each cell contains 
%       the Binary Association Matrix of a partition.
% trueK - the number of cluster of the ground truth. Some methods don't
%           require it, in that case any integer value can be inserted.
% perc - percentage of edges created with the graph, from 0.0 to 1.0. Values
%           too low are automatically handled, creating the minimum number 
%           of edges required for a fully-connected graph
% pi_ref - the Binary Association Matrix of the reference partition used in 
%           case of weighted voting, if selected. By default is one of the 
%           partitions with the greatest number of cluster labels.
% 
% OUTPUT:
% consensus - the label vector associated to the consensus partition
switch method
    case 'NMF'
        permSync = @SV_NMF;

    case 'QM'
        permSync = @SV_QM;

    case'EIG'
        permSync = @SV_EIG;
    otherwise
        error('Choosen implementation not available.')
end



%globally synchronized permutations
U = permSync(PI,perc,trueK);

%obtain the cumulative votes 
voteMatrix = syncVoting(voting,PI, U,pi_ref);

consensusBA = pluralityVoting(voteMatrix);
consensus = fromBAtoLV(consensusBA);

