function [NMI_votingSync,NMI_votingSync_gt,ARI_votingSync, ARI_votingSync_gt, acc_votingSync, tocSync,ACC_rel] = testSynchronization(method,K,N,PI,PI_LM, pi_gt,pi_gtLV,pi_ref, pi_refLV,PI_LMminusReference, votingFun, perc)
if strcmp(method, 'NMF')
    syncmethod = @syncImplementationNMF;
else 
    if strcmp(method, 'QuickShift')
            syncmethod = @syncImplementationQuickShift;
    
    else 
        if strcmp(method, 'Pachauri')
                syncmethod = @syncImplementationPachauri;
        end
    end
end
tic
[T_out, sigma] = syncmethod(PI,PI_LM,perc,  false, K);
[voteMatrix, V_cell] = votingFun(pi_ref, pi_refLV,PI,PI_LM,PI_LMminusReference, sigma);
tocSync = toc;
ACC_rel = relabelingAccuracy(V_cell,pi_gt);
pi_star = majorityVoting(voteMatrix);
pi_starLV = fromBAtoLV( pi_star);

acc_votingSync = classificationAccuracy(pi_gt,pi_star);
NMI_votingSync_gt  = nmi(pi_gtLV,pi_starLV);
ARI_votingSync_gt = useARI(pi_gtLV,pi_starLV);
[NMI_votingSync,ARI_votingSync] = average_metric(PI_LM, pi_starLV);
