function MISCL_ERROR = testPartitionRelabeling(params,min, max, step, n_it, votingFun,syncVotingFun,DEBUG)

if(nargin <8)
    DEBUG = true;
end
MISCL_PARTITION = [];
N = params(1);
M = params(2);
K = params(3);
p = params(4);
%ABBIAMO COMMENTATO PERMUTATION CONVERSION NEL RELABELING,
%DA FIXARE ANCORA
x_m  = [min:step:max];

for M = min:step:max

       
        
        miscl_iteration = relabelTestIteration([N, M,K,p],n_it);
        MISCL_PARTITION = [MISCL_PARTITION, sum(miscl_iteration, 2)/n_it];

    

end
    writematrix(MISCL_PARTITION,strcat("../../IMAGES/Relabeling/Partition/MISCL_Partition"));
