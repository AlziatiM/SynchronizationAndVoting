function [x_M,NMI_partition,ARI_partition,NMI_partition_gt,ARI_partition_gt, acc_partition, time_partition] = testPartition(params,min, max, step, n_it, votingFun,syncVotingFun,datasetName,pi_gt,variableK)



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
% clc[1,2,3
% close all
% addpath("Partition functions\")
% addpath("Partition functions/")
% addpath("Testing Functions\")
% addpath("Testing Functions/")
% addpath("Testing Functions/Metrics")
% addpath("Partition generation")
% addpath("ClusterPack-V2.0\")
% addpath("ClusterPack-V2.0/")
% addpath("Relabeling Functions\")
% addpath("Relabeling Functions/")
% addpath("Relabeling Functions\Linear Assignment Functions\")
% addpath("Relabeling Functions/Linear Assignment Functions/")
% addpath("Misc")
% addpath("Voting Functions\")
% addpath("Voting Functions/")

acc_partition =[];
NMI_partition = [];
ARI_partition = [];
NMI_partition_gt = [];
ARI_partition_gt = [];
time_partition = [];
NMI_rel = [];
ACC_rel = [];

NMI_iteration_global = [];
NMI_iteration_gt_global = [];

ARI_iteration_global = [];
ARI_iteration_gt_global = [];

acc_iteration_global = [];
% K = 3;
% N = 100;
% p = 0.9;
% DEBUG = true;
% step = 1;
% n_it = 50;
 x_M = [min:step:max];

    for M =     min:+step:max

       
        
           [NMI_iteration_gt,ARI_iteration_gt,NMI_iteration, ARI_iteration, acc_iteration, time_iteration,ACC_rel_iteration] = execTestIteration([N, M,K,p],n_it, votingFun,syncVotingFun, pi_gt, variableK );

        

%         statisticsMethods(NMI_iteration, datasetName, 'NMI', func2str(votingFun));
        NMI_partition = [NMI_partition, sum(NMI_iteration, 2)/n_it];
        ARI_partition = [ARI_partition, sum(ARI_iteration, 2)/n_it];
        
        NMI_iteration_global = [NMI_iteration_global, NMI_iteration];
        ARI_iteration_global = [ARI_iteration_global, ARI_iteration];

        NMI_partition_gt = [NMI_partition_gt, sum(NMI_iteration_gt, 2)/n_it];
        ARI_partition_gt = [ARI_partition_gt, sum(ARI_iteration_gt, 2)/n_it];
        
        NMI_iteration_gt_global = [NMI_iteration_gt_global, NMI_iteration_gt];
        ARI_iteration_gt_global = [ARI_iteration_gt_global, ARI_iteration_gt];


        acc_partition =  [acc_partition, sum(acc_iteration,2)/n_it];
        acc_iteration_global = [acc_iteration_global, acc_iteration];


        time_partition = [time_partition, sum(time_iteration,2)/n_it];
        
        ACC_rel = [ACC_rel, sum(ACC_rel_iteration,2)/n_it];

        std_NMI = std(NMI_iteration,0,2);
        std_NMI_GT= std(NMI_iteration_gt,0,2);
        std_ARI = std(ARI_iteration,0,2);
        std_ARI_GT = std(ARI_iteration_gt,0,2);
        std_TIME = std(time_iteration,0,2);
        std_ACC= std(acc_iteration,0,2);
        std_ACC_REL = std(ACC_rel,0,2);
        save(strcat('testPartition_', func2str(votingFun), "_", datasetName));
    end
        
         writematrix(std_NMI_GT,  strcat("../../Results/", datasetName,"/Partitions/STD_NMI_gt_", func2str(votingFun), "_", datasetName ));
        writematrix(std_NMI,  strcat("../../Results/", datasetName,"/Partitions/STD_NMI_", func2str(votingFun), "_", datasetName ));

        writematrix(std_ARI_GT,  strcat("../../Results/", datasetName,"/Partitions/STD_ARI_gt_", func2str(votingFun), "_", datasetName ));
        writematrix(std_ARI,  strcat("../../Results/", datasetName,"/Partitions/STD_ARI_", func2str(votingFun), "_", datasetName ));

        writematrix(std_ACC,  strcat("../../Results/", datasetName,"/Partitions/STD_ACC_", func2str(votingFun), "_", datasetName ));
        writematrix(std_TIME,  strcat("../../Results/", datasetName,"/Partitions/STD_time_", func2str(votingFun), "_", datasetName ));
        writematrix(std_ACC_REL,  strcat("../../Results/", datasetName,"/Partitions/STD_ACC_rel_", func2str(votingFun), "_", datasetName ));




        writematrix(NMI_partition_gt,  strcat("../../Results/", datasetName,"/Partitions/NMI_partition_gt_", func2str(votingFun), "_", datasetName ));
        writematrix(NMI_partition,  strcat("../../Results/", datasetName,"/Partitions/NMI_partition_", func2str(votingFun), "_", datasetName ));

        writematrix(ARI_partition_gt,  strcat("../../Results/", datasetName,"/Partitions/ARI_partition_gt_", func2str(votingFun), "_", datasetName ));
        writematrix(ARI_partition,  strcat("../../Results/", datasetName,"/Partitions/ARI_partition_", func2str(votingFun), "_", datasetName ));

        writematrix(acc_partition,  strcat("../../Results/", datasetName,"/Partitions/acc_partition_", func2str(votingFun), "_", datasetName ));
        writematrix(time_partition,  strcat("../../Results/", datasetName,"/Partitions/time_partition_", func2str(votingFun), "_", datasetName ));
        writematrix(ACC_rel,  strcat("../../Results/", datasetName,"/Partitions/ACC_partition_rel_", func2str(votingFun), "_", datasetName ));

        writematrix(NMI_iteration_global,  strcat("../../Results/", datasetName,"/Partitions/Iteration/NMI_iteration_", func2str(votingFun), "_", datasetName, "_", int2str(n_it) ));
        writematrix(NMI_iteration_gt_global,  strcat("../../Results/", datasetName,"/Partitions/Iteration/NMI_iteration_gt_", func2str(votingFun), "_", datasetName,"_", int2str(n_it) ));

    
        writematrix(ARI_iteration_global,  strcat("../../Results/", datasetName,"/Partitions/Iteration/ARI_iteration_", func2str(votingFun), "_", datasetName, "_", int2str(n_it) ));
        writematrix(ARI_iteration_gt_global,  strcat("../../Results/", datasetName,"/Partitions/Iteration/ARI_iteration_gt_", func2str(votingFun), "_", datasetName,"_", int2str(n_it) ));

            writematrix(acc_iteration_global,  strcat("../../Results/", datasetName,"/Partitions/Iteration/ACC_iteration_", func2str(votingFun), "_", datasetName,"_", int2str(n_it) ));




% plotMetrics(x_M,NMI_partition,ARI_partition,NMI_partition_gt,ARI_partition_gt, "with different number of partitions", legend, "# of partitions");

