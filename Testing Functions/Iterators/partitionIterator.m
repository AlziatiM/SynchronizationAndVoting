function partitionIterator(min, max, step, funToIterate, ensembleParams, testParams, voting_fun)
N = ensembleParams(1);
M = ensembleParams(2);
K = ensembleParams(3);
p = ensembleParams(4);



mint= testParams(1);
maxt = testParams(2);
stept = testParams(3);
n_it = testParams(4);





for M = min:step:max
   [x_p,NMI_noise1,ARI_noise1,NMI_noise_gt1,ARI_noise_gt1] = funToIterate([N,M,K,p],mint, maxt, stept, n_it,voting_fun);
    
   writematrix(NMI_noise_gt1, strcat("IMAGES\Noise\NMI_noise_gt_M",func2str(voting_fun),  string(M)));


end

writematrix(x_p, "IMAGES\x_p");
