function[NMI_iteration_gt, ARI_iteration_gt, NMI_iteration, ARI_iteration,acc_iteration, toc_iteration,ACC_rel_iteration] = execTestIterationNoise(params, n_it, votingFun,syncVotingFun, dataset, variableK)

N = params(1);
M = params(2);
K = params(3);
p = params(4);
p_sync = params(5);

NMI_iteration = [];
ARI_iteration = [];
toc_iteration = [];
NMI_iteration_gt = [];
ARI_iteration_gt = [];
acc_iteration =[];


for i = 1:n_it
    if isempty(dataset)

        [X,pi_gt] = generateGroundTruth(K,N,15);
        PI = generatePartitionKMeans(M, X,K, variableK);
        pi_gtLV = fromBAtoLV(pi_gt);

    else
        LV_int = dataset(:,1);
        pi_gtLV = LV_int;
        pi_gt = fromLVtoBA(LV_int);
        dataset_nogt = dataset;
        dataset_nogt(:,1) = [];
        PI = generatePartitionKMeans(M, dataset_nogt, K,variableK);
        %          PI = generatePartitionRandom(M, dataset_nogt, K,1);

    end
    


    [s,d] = cellfun(@size,PI);

    [K_max, max_idx] = max(d);
    pi_ref = PI{max_idx};
    PI_minusref = PI;
    PI_minusref(max_idx,:) = [];
    PI_LM = EnsembleLabelMAtrix(PI);
    PI_LM_minusref = PI_LM;
    PI_LM_minusref(max_idx,:) = [];
    pi_refLV = PI_LM(max_idx,:)';

    NMI_votingSyncP = [];
    NMI_votingSync_gtP = [];
    ARI_votingSyncP = [];
    ARI_votingSync_gtP = [];
    acc_votingSyncP = [];
    tocSyncP = [];
    ACC_rel_SyncP = [];




  



    if ~variableK
        [NMI_votingSyncP,NMI_votingSync_gtP,ARI_votingSyncP, ARI_votingSync_gtP, acc_votingSyncP, tocSyncP,ACC_rel_SyncP] = testSynchronization('Pachauri',K,N,PI,PI_LM ,pi_gt, pi_gtLV,pi_ref, pi_refLV, PI_LM_minusref,syncVotingFun,p_sync);
    end
    
    
    [NMI_votingSyncNMF,NMI_votingSync_gtNMF,ARI_votingSyncNMF, ARI_votingSync_gtNMF, acc_votingSyncNMF, tocSyncNMF,ACC_rel_SyncNMF] = testSynchronization('NMF',K,N,PI,PI_LM ,pi_gt, pi_gtLV,pi_ref, pi_refLV, PI_LM_minusref,syncVotingFun,p_sync);
    [NMI_votingSyncQS,NMI_votingSync_gtQS,ARI_votingSyncQS, ARI_votingSync_gtQS, acc_votingSyncQS, tocSyncQS,ACC_rel_SyncQS] = testSynchronization('QuickShift',K,N,PI,PI_LM ,pi_gt, pi_gtLV,pi_ref, pi_refLV, PI_LM_minusref,syncVotingFun,p_sync);
   







    toc_iteration = [toc_iteration, [tocSyncNMF; tocSyncQS;tocSyncP]];


    NMI_iteration = [NMI_iteration,[ NMI_votingSyncNMF; NMI_votingSyncQS;NMI_votingSyncP]];
    ARI_iteration = [ARI_iteration, [ARI_votingSyncNMF; ARI_votingSyncQS;ARI_votingSyncP]];
% 


   NMI_iteration_gt = [NMI_iteration_gt, [NMI_votingSync_gtNMF; NMI_votingSync_gtQS;NMI_votingSync_gtP]];
    ARI_iteration_gt = [ARI_iteration_gt, [ARI_votingSync_gtNMF; ARI_votingSync_gtQS;ARI_votingSync_gtP]];
% 

    acc_iteration = [acc_iteration, [acc_votingSyncNMF; acc_votingSyncQS;acc_votingSyncP]];


end


