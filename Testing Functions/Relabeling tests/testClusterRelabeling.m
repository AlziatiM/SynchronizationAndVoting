function MISCL_ERROR = testClusterRelabeling(params,min, max, step, n_it, votingFun,syncVotingFun,DEBUG)

if(nargin <8)
    DEBUG = true;
end
MISCL_Cluster = [];
N = params(1);
M = params(2);
K = params(3);
p = params(4);
%ABBIAMO COMMENTATO PERMUTATION CONVERSION NEL RELABELING,
%DA FIXARE ANCORA
x_K  = [min:step:max];

for K = min:step:max

       
        
        miscl_iteration = relabelTestIteration([N, M,K,p],n_it);
        MISCL_Cluster = [MISCL_Cluster, sum(miscl_iteration, 2)/n_it];

    

end
    writematrix(MISCL_Cluster,strcat("../../IMAGES/Relabeling/Cluster/MISCL_Cluster"));


