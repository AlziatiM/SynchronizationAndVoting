function miscl_iteration = relabelTestIteration(params, n_it)
N = params(1);
M = params(2);
K = params(3);
p = params(4);
miscl_iteration = [];
for i = 1:n_it
    [~,pi_gt] = generateGroundTruth(K,N,4);
    PI = generatePartitions(M, pi_gt, p);

    permHung = relabelEnsemble("Hungarian", PI);
    permJonk = relabelEnsemble("Jonker-Volgenant", PI);
    permMatch = relabelEnsemble("Matchpairs", PI);
    permRegr = relabelEnsemble("Regression", PI);
    permSync = relabelEnsemble("Sync", PI);
    permMcla = relabelEnsemble("Mcla", PI);

    ref_indx = 0;
    M_mcla = M;


    for k = 1: M_mcla

        if max(fromBAtoLV(permMcla{k})) == K
            ref_indx = k;
            break;
        end
    end



misclMcla_it = misclassificationerror(pi_gt,PI, permMcla,ref_indx);
misclHung_it = misclassificationerror(pi_gt,PI, permHung, 1);
misclJonk_it = misclassificationerror(pi_gt,PI, permJonk, 1);
misclMatch_it = misclassificationerror(pi_gt,PI, permMatch, 1);
misclRegr_it = misclassificationerror(pi_gt,PI, permRegr, 1);
misclSync_it = misclassificationerror(pi_gt,PI, permSync, 1);

miscl_iteration = [miscl_iteration, [misclHung_it;misclRegr_it;misclMatch_it;misclJonk_it;misclSync_it; misclMcla_it]];

%     miscl_iteration = [miscl_iteration, [misclHung_it;misclMatch_it;misclJonk_it;misclSync_it]];

end

