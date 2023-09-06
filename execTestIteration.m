
N = params(1);
M = params(2);
K = params(3);
p = params(4);

NMI_iteration = [];


        [X,pi_gt] = generateGroundTruth(K,N,15);
        PI = generatePartitionKMeans(M, X,K, variableK);
        pi_gtLV = fromBAtoLV(pi_gt);

   

    [s,d] = cellfun(@size,PI);

    [K_max, max_idx] = max(d);
    pi_ref = PI{max_idx};
    PI_minusref = PI;
    PI_minusref(max_idx,:) = [];
    PI_LM = EnsembleLabelMAtrix(PI);
    PI_LM_minusref = PI_LM;
    PI_LM_minusref(max_idx,:) = [];
    pi_refLV = PI_LM(max_idx,:)';

    %%%%%%%%%%%

    SS = sparse(cell2mat(PI'));
    w_ini=ranking(SS,M);
    S=SS'*SS;
    d=1./sqrt(max(sum(S,2),eps));
    S=eye(size(S))-diag(d)*S*diag(d);
    S=(S+S')./2;

    tic
    lambda=10.^0;
    nk=length(w_ini);
    options = optimoptions('quadprog','Algorithm','trust-region-reflective','Display','off');
    w=quadprog(2.*(S+(lambda).*eye(nk)),-2.*(lambda)*w_ini',[],[],[],[],zeros(nk,1),ones(nk,1),[],options);
    pi_star_CESHL =CESHL( SS,w,K )';
    tocCESHL = toc;

    


    %     tic;
    %     relVotingMatch = votingFun("Matchpairs", pi_ref,pi_refLV,PI_minusref,PI_LM_minusref);
    %     tocMatch = toc;
    %
    %     tic;
    %     relVotingHung = votingFun("Hungarian", pi_ref,pi_refLV,PI_minusref,PI_LM_minusref);
    %     tocHung = toc;
    %
    %     tic;
    %     relVotingRegr = votingFun("Regression", pi_ref,pi_refLV,PI_minusref,PI_LM_minusref);
    %     tocRegr = toc;
    %     tic;
    %     relVotingJV = votingFun("Jonker-Volgenant", pi_ref,pi_refLV,PI_minusref,PI_LM_minusref);
    %     tocJV= toc;




    %     tic;
    %     relVotingMatch = votingFun("Partial", pi_ref,pi_refLV,PI,PI_LM,PI_minusref,PI_LM_minusref);
    %     tocMatch = toc;

%     tic;
%     [relVotingHung, V_cellHung] = votingFun("Partial", pi_ref,pi_refLV,PI,PI_LM,PI_minusref,PI_LM_minusref);
%     tocHung = toc;
% 
%     tic;
%     [relVotingRegr, V_cellRegr] = votingFun("Regression", pi_ref,pi_refLV,PI,PI_LM,PI_minusref,PI_LM_minusref);
%     tocRegr = toc;
% 
% 
%     ACC_rel_hung = relabelingAccuracy(V_cellHung,pi_gt);
%     ACC_rel_regr = relabelingAccuracy(V_cellRegr,pi_gt);
% 
% 
% 
% 
% 
% 
% 
%     pi_star_votingHungBA = majorityVoting(relVotingHung);
%     pi_star_votingRegrBA = majorityVoting(relVotingRegr);
%     %     pi_star_votingMatchBA = majorityVoting(relVotingMatch);
%     %     pi_star_votingJVBA = majorityVoting(relVotingJV);
% 
%     pi_star_votingHung = fromBAtoLV(pi_star_votingHungBA);
%     pi_star_votingRegr = fromBAtoLV(pi_star_votingRegrBA);
%     %     pi_star_votingMatch = fromBAtoLV(pi_star_votingMatchBA);
%     %     pi_star_votingJV = fromBAtoLV(pi_star_votingJVBA);
% 
%     pi_star_random = PI_LM(randi(M), :)';
% 
%     pi_star_randomBA = fromLVtoBA(pi_star_random);
%     cd ../../ClusterPack-V2.0/;
% 
% 
%     tic;
%     relVotingMCLA = mcla(PI_LM, K)';
%     tocmcla = toc;
%     pi_star_mclaBA = majorityVoting(relVotingMCLA);
%     pi_star_mcla = fromBAtoLV(pi_star_mclaBA);
%     %
%     %     tic;
%     %     pi_star_hgpa = hgpa(PI_LM)';
%     %     tochgpa = toc;
%     %      pi_star_hgpaBA = fromLVtoBA(pi_star_hgpa);
% 
% 
%     tic;
%     pi_star_cspa = cspa(PI_LM, K)';
%     toccspa = toc;
%     pi_star_cspaBA = fromLVtoBA(pi_star_cspa);
%     cd ../'Testing Functions'/Iterators/;

    NMI_votingSyncP = [];
    NMI_votingSync_gtP = [];
    ARI_votingSyncP = [];
    ARI_votingSync_gtP = [];
    acc_votingSyncP = [];
    tocSyncP = [];
    ACC_rel_SyncP = [];

    %     if ~variableK
    %         [NMI_votingSyncP,NMI_votingSync_gtP,ARI_votingSyncP, ARI_votingSync_gtP, acc_votingSyncP, tocSyncP,ACC_rel_SyncP] = testSynchronization('Pachauri',K,N,PI,PI_LM ,pi_gt, pi_gtLV,pi_ref, pi_refLV, PI_LM_minusref,syncVotingFun,p_sync);
    %     end
    %
    %
    % [NMI_votingSyncNMF,NMI_votingSync_gtNMF,ARI_votingSyncNMF, ARI_votingSync_gtNMF, acc_votingSyncNMF, tocSyncNMF,ACC_rel_SyncNMF] = testSynchronization('NMF',K,N,PI,PI_LM ,pi_gt, pi_gtLV,pi_ref, pi_refLV, PI_LM_minusref,syncVotingFun,1);
    %
    %
    %
    % [NMI_votingSync,NMI_votingSync_gt,ARI_votingSync, ARI_votingSync_gt, acc_votingSync, tocSync,ACC_rel_Sync] = testSynchronization('QuickShift',K,N,PI,PI_LM ,pi_gt, pi_gtLV,pi_ref, pi_refLV, PI_LM_minusref,syncVotingFun,p_sync);

%     [NMI_votingSyncNMF,NMI_votingSync_gtNMF,ARI_votingSyncNMF, ARI_votingSync_gtNMF, acc_votingSyncNMF, tocSyncNMF,ACC_rel_SyncNMF] = testSynchronization('NMF',K,N,PI,PI_LM ,pi_gt, pi_gtLV,pi_ref, pi_refLV, PI_LM_minusref,syncVotingFun,1);
% 
% 
% 
%     [NMI_votingSync,NMI_votingSync_gt,ARI_votingSync, ARI_votingSync_gt, acc_votingSync, tocSync,ACC_rel_Sync] = testSynchronization('NMF',K,N,PI,PI_LM ,pi_gt, pi_gtLV,pi_ref, pi_refLV, PI_LM_minusref,syncVotingFun,0.4);
% 
% 
% 
% 
%     [NMI_votingHung, ARI_votingHung] = average_metric(PI_LM,pi_star_votingHung);
%     [NMI_votingRegr, ARI_votingRegr] = average_metric(PI_LM,pi_star_votingRegr);
%     %     [NMI_votingMatch, ARI_votingMatch] = average_metric(PI_LM,pi_star_votingMatch);
%     %     [NMI_votingJV, ARI_votingJV] = average_metric(PI_LM,pi_star_votingJV);
%     [NMI_mcla, ARI_mcla] = average_metric(PI_LM,pi_star_mcla);
%     %     [NMI_hgpa, ARI_hgpa] = average_metric(PI_LM,pi_star_hgpa);
%     [NMI_cspa, ARI_cspa] = average_metric(PI_LM,pi_star_cspa);
    [NMI_CESHL, ARI_CESHL] = average_metric(PI_LM,pi_star_CESHL);

%     [NMI_random, ARI_random] = average_metric(PI_LM,pi_star_random);

    NMI_CESHL_gt  = nmi(pi_gtLV, pi_star_CESHL);
    ARI_CESHL_gt = useARI(pi_gtLV, pi_star_CESHL);
% 
%     NMI_votingHung_gt  = nmi(pi_gtLV, pi_star_votingHung);
%     ARI_votingHung_gt = useARI(pi_gtLV, pi_star_votingHung);
% 
%     NMI_votingRegr_gt = nmi(pi_gtLV, pi_star_votingRegr);
%     ARI_votingRegr_gt = useARI(pi_gtLV, pi_star_votingRegr);
% 
%     %     NMI_votingMatch_gt= nmi(pi_gtLV, pi_star_votingMatch);
%     %     ARI_votingMatch_gt = useARI(pi_gtLV, pi_star_votingMatch);
%     %
%     %     NMI_votingJV_gt= nmi(pi_gtLV, pi_star_votingJV);
%     %     ARI_votingJV_gt = useARI(pi_gtLV, pi_star_votingJV);
% 
%     NMI_mcla_gt= nmi(pi_gtLV, pi_star_mcla);
%     ARI_mcla_gt = useARI(pi_gtLV, pi_star_mcla);
% 
%     NMI_random_gt= nmi(pi_gtLV, pi_star_random);
%     ARI_random_gt = useARI(pi_gtLV, pi_star_random);
%     %
%     %     NMI_hgpa_gt= nmi(pi_gtLV, pi_star_hgpa);
%     %     ARI_hgpa_gt = useARI(pi_gtLV, pi_star_hgpa);
% 
%     NMI_cspa_gt= nmi(pi_gtLV, pi_star_cspa);
%     ARI_cspa_gt = useARI(pi_gtLV, pi_star_cspa);
% 
%     accMcla_it = classificationAccuracy(pi_gt, pi_star_mclaBA);
%     accHung_it = classificationAccuracy(pi_gt,pi_star_votingHungBA);
%     %     accJonk_it = classificationAccuracy(pi_gt,pi_gtLV,mat2cell(pi_star_votingJVBA,N), pi_star_votingJV',[], []);
%     %     accMatch_it = classificationAccuracy(pi_gt,pi_gtLV,mat2cell(pi_star_votingMatchBA,N),pi_star_votingMatch', [], []);
%     accRegr_it = classificationAccuracy(pi_gt,pi_star_votingRegrBA);
%     %     acchgpa_it = classificationAccuracy(pi_gt,pi_gtLV,mat2cell(pi_star_hgpaBA,N,K),pi_star_hgpa', [],[]);
%     acccspa_it = classificationAccuracy(pi_gt,pi_star_cspaBA);
%     accrandom_it = classificationAccuracy(pi_gt,pi_star_randomBA);
    accCESHL_it = classificationAccuracy(pi_gt,fromLVtoBA(pi_star_CESHL));









%     toc_iteration = [toc_iteration, [tocHung;tocRegr;tocmcla;tocSyncNMF; tocSync;toccspa;tocSyncP;tocCESHL]];
         toc_iteration = [toc_iteration, tocCESHL];


%     NMI_iteration = [NMI_iteration, [NMI_votingHung;NMI_votingRegr;NMI_mcla;NMI_votingSyncNMF;NMI_votingSync;NMI_cspa;NMI_random;NMI_votingSyncP;NMI_CESHL]];
%     ARI_iteration = [ARI_iteration, [ARI_votingHung;ARI_votingRegr;ARI_mcla;ARI_votingSyncNMF;ARI_votingSync;ARI_cspa;ARI_random;ARI_votingSyncP;ARI_CESHL]];
%     %
  NMI_iteration = [NMI_iteration, NMI_CESHL];
    ARI_iteration = [ARI_iteration, ARI_CESHL];
    

%     NMI_iteration_gt = [NMI_iteration_gt, [NMI_votingHung_gt;NMI_votingRegr_gt;NMI_mcla_gt;NMI_votingSync_gtNMF;NMI_votingSync_gt;NMI_cspa_gt;NMI_random_gt;NMI_votingSync_gtP;NMI_CESHL_gt]];
%     ARI_iteration_gt = [ARI_iteration_gt, [ARI_votingHung_gt;ARI_votingRegr_gt;ARI_mcla_gt;ARI_votingSync_gtNMF;ARI_votingSync_gt;ARI_cspa_gt;ARI_random_gt;ARI_votingSync_gtP;ARI_CESHL_gt]];

    NMI_iteration_gt = [NMI_iteration_gt, NMI_CESHL_gt];
    ARI_iteration_gt = [ARI_iteration_gt, ARI_CESHL_gt];


%     acc_iteration = [acc_iteration, [accHung_it;accRegr_it; accMcla_it;acc_votingSyncNMF;acc_votingSync;acccspa_it;accrandom_it;acc_votingSyncP;accCESHL_it]];
    acc_iteration = [acc_iteration,accCESHL_it];

%     ACC_rel_iteration = [ACC_rel_iteration, [ACC_rel_hung;ACC_rel_regr;ACC_rel_SyncNMF; ACC_rel_Sync;ACC_rel_SyncP]];

save(strcat("CESHL_USPS_IT_",string(i),".mat"));
end

