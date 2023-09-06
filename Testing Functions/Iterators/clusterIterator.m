function clusterIterator(min, max, step, funToIterate, ensembleParams, testParams, voting_fun,syncVotingFun)
N = ensembleParams(1);
M = ensembleParams(2);
K = ensembleParams(3);
p = ensembleParams(4);



mint= testParams(1);
maxt = testParams(2);
stept = testParams(3);
n_it = testParams(4);



for K = min:step:max
   [x_p,NMI_noise1,ARI_noise1,NMI_noise_gt1,ARI_noise_gt1, miscl_noise] = funToIterate([N,M,K,p],mint, maxt, stept, n_it,voting_fun,syncVotingFun);
    
   writematrix(NMI_noise_gt1, strcat("../../IMAGES/Noise/NMI_noise_gt_",func2str(voting_fun), "_K", string(K)));
   writematrix(NMI_noise_gt1, strcat("../../IMAGES/Noise/miscl_noise_",func2str(voting_fun), "_K", string(K)));


end

writematrix(x_p, "../../IMAGES/x_p");