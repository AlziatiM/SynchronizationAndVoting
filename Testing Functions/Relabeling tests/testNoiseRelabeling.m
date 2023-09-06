function MISCL_ERROR = testNoiseRelabeling(params,min, max, step, n_it, votingFun,syncVotingFun,DEBUG)

if(nargin <8)
    DEBUG = true;
end
MISCL_NOISE = [];
N = params(1);
M = params(2);
K = params(3);
p = params(4);
%ABBIAMO COMMENTATO PERMUTATION CONVERSION NEL RELABELING,
%DA FIXARE ANCORA
x_p  = [min:step:max];

for p = min:step:max

       
        
        miscl_iteration = relabelTestIteration([N, M,K,p],n_it);
        MISCL_NOISE = [MISCL_NOISE, sum(miscl_iteration, 2)/n_it];

    

end
writematrix( MISCL_NOISE,strcat("../../IMAGES/Relabeling/Noise/MISCL_Noise", "_M", string(M)));



