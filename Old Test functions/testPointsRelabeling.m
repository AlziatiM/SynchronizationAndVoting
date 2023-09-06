function MISCL_ERROR = testPointsRelabeling(params,min, max, step, n_it, votingFun,syncVotingFun,DEBUG)

if(nargin <8)
    DEBUG = true;
end
MISCL_Points = [];
N = params(1);
M = params(2);
K = params(3);
p = params(4);
%ABBIAMO COMMENTATO PERMUTATION CONVERSION NEL RELABELING,
%DA FIXARE ANCORA
x_N  = [min:step:max];

for N = min:step:max

       
        
        miscl_iteration = relabelTestIteration([N, M,K,p],n_it);
        MISCL_Points = [MISCL_Points, sum(miscl_iteration, 2)/n_it];

    

end
    writematrix(MISCL_Points,strcat("../../IMAGES/Relabeling/Points/MISCL_Points"));

