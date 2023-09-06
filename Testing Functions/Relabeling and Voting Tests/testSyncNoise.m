function [x_p,NMI_noise,ARI_noise,NMI_noise_gt,ARI_noise_gt, miscl_noise] = testSyncNoise(params,min, max, step, n_it, votingFun,syncVotingFun,datasetName,pi_gt,variableK)


N = params(1);
M = params(2);
K = params(3);
p = params(4);

% VALORI REALISTICI
%
% K = 2..10
% M = 2...10/10...100
% X = 100...1000

% clear
% clc
% close all
% addpath("noiseSync functions\")
% addpath("Testing Functions\")
% addpath("noiseSync generation")
% addpath("noiseSync functions/")
% addpath("Testing Functions/")
% addpath("Testing Functions/Metrics")
% addpath("ClusterPack-V2.0\")
% addpath("Relabeling Functions\")
% addpath("Relabeling Functions\Linear Assignment Functions\")
% addpath("Misc")
% addpath("Misc\Plotting functions")
%
% addpath("Voting Functions\")


acc_noiseSync =[];
NMI_noiseSync = [];
ARI_noiseSync = [];
NMI_noiseSync_gt = [];
ARI_noiseSync_gt = [];
time_noiseSync = [];
NMI_rel = [];
ACC_rel = [];

NMI_iteration_global = [];
NMI_iteration_gt_global = [];
% K = 3;
% N = 100;
% M = 5;
% DEBUG = true;
% step = 0.1;
% n_it = 2;
x_p  = min:step:max;

    NMI_votingSyncP = [];
    NMI_votingSync_gtP = [];
    ARI_votingSyncP = [];
    ARI_votingSync_gtP = [];
    acc_votingSyncP = [];
    tocSyncP = [];
    ACC_rel_SyncP = [];

for p_sync = min:step:max

    [NMI_iteration_gt,ARI_iteration_gt,NMI_iteration, ARI_iteration, miscl_iteration, time_iteration] = execTestIterationNoise([N, M,K,p, p_sync],n_it, votingFun,syncVotingFun, pi_gt, variableK);




    NMI_noiseSync = [NMI_noiseSync, sum(NMI_iteration, 2)/n_it];
    ARI_noiseSync = [ARI_noiseSync, sum(ARI_iteration, 2)/n_it];

    NMI_iteration_global = [NMI_iteration_global, NMI_iteration];


    NMI_noiseSync_gt = [NMI_noiseSync_gt, sum(NMI_iteration_gt, 2)/n_it];
    ARI_noiseSync_gt = [ARI_noiseSync_gt, sum(ARI_iteration_gt, 2)/n_it];

    NMI_iteration_gt_global = [NMI_iteration_gt_global, NMI_iteration_gt];


    acc_noiseSync =  [acc_noiseSync, sum(miscl_iteration,2)/n_it];

    time_noiseSync = [time_noiseSync, sum(time_iteration,2)/n_it];



    std_NMISync = std(NMI_iteration,0,2);
    std_NMISync_GT= std(NMI_iteration_gt,0,2);
    std_ARISync = std(ARI_iteration,0,2);
    std_ARISync_GT = std(ARI_iteration_gt,0,2);
    std_TIMESync = std(time_iteration,0,2);
    std_MISCLSync= std(miscl_iteration,0,2);

end



writematrix(NMI_noiseSync_gt,  strcat("../../Results/", datasetName,"/NoiseSync/NMI_noise_gt_", func2str(votingFun), "_", datasetName));
writematrix(NMI_noiseSync,  strcat("../../Results/", datasetName,"/NoiseSync/NMI_noise_", func2str(votingFun), "_", datasetName));

writematrix(ARI_noiseSync_gt,  strcat("../../Results/", datasetName,"/NoiseSync/ARI_noise_gt_", func2str(votingFun), "_", datasetName));
writematrix(ARI_noiseSync,  strcat("../../Results/", datasetName,"/NoiseSync/ARI_noise_", func2str(votingFun), "_", datasetName));

writematrix(acc_noiseSync,  strcat("../../Results/", datasetName,"/NoiseSync/acc_noise_", func2str(votingFun), "_", datasetName));
writematrix(time_noiseSync,  strcat("../../Results/", datasetName,"/NoiseSync/time_noise_", func2str(votingFun), "_", datasetName));


writematrix(std_NMISync_GT,  strcat("../../Results/", datasetName,"/NoiseSync/STD_NMI_gt_", func2str(votingFun), "_", datasetName ));
writematrix(std_NMISync,  strcat("../../Results/", datasetName,"/NoiseSync/STD_NMI_", func2str(votingFun), "_", datasetName ));

writematrix(std_ARISync_GT,  strcat("../../Results/", datasetName,"/NoiseSync/STD_ARI_gt_", func2str(votingFun), "_", datasetName ));
writematrix(std_ARISync,  strcat("../../Results/", datasetName,"/NoiseSync/STD_ARI_", func2str(votingFun), "_", datasetName ));

writematrix(std_MISCLSync,  strcat("../../Results/", datasetName,"/NoiseSync/STD_miscl_", func2str(votingFun), "_", datasetName ));
writematrix(std_TIMESync,  strcat("../../Results/", datasetName,"/NoiseSync/STD_time_", func2str(votingFun), "_", datasetName ));

end
