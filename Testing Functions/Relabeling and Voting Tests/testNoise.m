function [x_p,NMI_noise,ARI_noise,NMI_noise_gt,ARI_noise_gt, miscl_noise] = testNoise(params,min, max, step, n_it, votingFun,syncVotingFun,pi_gt)


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
% addpath("Partition functions\")
% addpath("Testing Functions\")
% addpath("Partition generation")
% addpath("Partition functions/")
% addpath("Testing Functions/")
% addpath("Testing Functions/Metrics")
% addpath("ClusterPack-V2.0\")
% addpath("Relabeling Functions\")
% addpath("Relabeling Functions\Linear Assignment Functions\")
% addpath("Misc")
% addpath("Misc\Plotting functions")
%
% addpath("Voting Functions\")


NMI_noise = [];
miscl_noise = [];
time_noise = [];
ARI_noise = [];
NMI_noise_gt = [];
ARI_noise_gt = [];
% K = 3;
% N = 100;
% M = 5;
% DEBUG = true;
% step = 0.1;
% n_it = 2;
x_p  = min:step:max;


for p = min:step:max

    if(nargin <9)

        [NMI_iteration_gt,ARI_iteration_gt,NMI_iteration, ARI_iteration, miscl_iteration, time_iteration] = execTestIteration([N, M,K,p],n_it, votingFun,syncVotingFun);
        datasetName = "GaussianSynth";
    else
        [NMI_iteration_gt,ARI_iteration_gt,NMI_iteration, ARI_iteration, miscl_iteration, time_iteration] = execTestIteration([N, M,K,p],n_it, votingFun,syncVotingFun, pi_gt );

    end
    NMI_noise = [NMI_noise, sum(NMI_iteration, 2)/n_it];
    ARI_noise = [ARI_noise, sum(ARI_iteration, 2)/n_it];

    NMI_noise_gt = [NMI_noise_gt, sum(NMI_iteration_gt, 2)/n_it];
    ARI_noise_gt = [ARI_noise_gt, sum(ARI_iteration_gt, 2)/n_it];

    miscl_noise =  [miscl_noise, sum(miscl_iteration,2)/n_it];

    time_noise = [time_noise, sum(time_iteration,2)/n_it];

    std_NMI = std(NMI_iteration,0,2);
    std_NMI_GT= std(NMI_iteration_gt,0,2);
    std_ARI = std(ARI_iteration,0,2);
    std_ARI_GT = std(ARI_iteration_gt,0,2);
    std_TIME = std(time_iteration,0,2);
    std_MISCL= std(miscl_iteration,0,2);

end

writematrix(NMI_noise_gt,  strcat("../../Results/", datasetName,"/Noise/NMI_noise_gt_", func2str(votingFun), "_", datasetName));
writematrix(NMI_noise,  strcat("../../Results/", datasetName,"/Noise/NMI_noise_", func2str(votingFun), "_", datasetName));

writematrix(ARI_noise_gt,  strcat("../../Results/", datasetName,"/Noise/ARI_noise_gt_", func2str(votingFun), "_", datasetName));
writematrix(ARI_noise,  strcat("../../Results/", datasetName,"/Noise/ARI_noise_", func2str(votingFun), "_", datasetName));

writematrix(miscl_noise,  strcat("../../Results/", datasetName,"/Noise/miscl_noise_", func2str(votingFun), "_", datasetName));
writematrix(time_noise,  strcat("../../Results/", datasetName,"/Noise/time_noise_", func2str(votingFun), "_", datasetName));


writematrix(std_NMI_GT,  strcat("../../Results/", datasetName,"/Noise/STD_NMI_gt_", func2str(votingFun), "_", datasetName ));
writematrix(std_NMI,  strcat("../../Results/", datasetName,"/Noise/STD_NMI_", func2str(votingFun), "_", datasetName ));

writematrix(std_ARI_GT,  strcat("../../Results/", datasetName,"/Noise/STD_ARI_gt_", func2str(votingFun), "_", datasetName ));
writematrix(std_ARI,  strcat("../../Results/", datasetName,"/Noise/STD_ARI_", func2str(votingFun), "_", datasetName ));

writematrix(std_MISCL,  strcat("../../Results/", datasetName,"/Noise/STD_miscl_", func2str(votingFun), "_", datasetName ));
writematrix(std_TIME,  strcat("../../Results/", datasetName,"/Noise/STD_time_", func2str(votingFun), "_", datasetName ));

end
