addpath(genpath("ExtLib"));
addpath(genpath("Misc"));
addpath(genpath("Partition generation"));
addpath(genpath("Relabeling Functions"));
addpath(genpath("Voting Functions"));

N = 100;
M = 20;
K = 50;
perc = 0.9;
variableK = true;

[X,pi_gt] = generateGroundTruth(K,N,15);
PI = generatePartitionKMeans(M, X,K, variableK);


pi_gtLV = fromBAtoLV(pi_gt);
PI_LM = EnsembleLabelMatrix(PI);


[~,Kvector] = cellfun(@size,PI);

%selecting as reference partition the one with the highest number of clusters.
[~, maxK_idx] = max(Kvector);
pi_ref = PI{maxK_idx};


pi_star = synchronizationAndVoting('NMF','simple',PI,K,perc,pi_ref);

[ANMI, ~] = average_metric(PI_LM,pi_star);


NMI_gt  = nmi(pi_gtLV, pi_star);

disp('Consensus Partition created')
resultsANMI = ['Average NMI: ', num2str(ANMI)];
disp(resultsANMI);
resultsNMIgt = ['NMI w.r.t the ground truth: ', num2str(NMI_gt)];
disp(resultsNMIgt);
