function [x_K,NMI_cluster,ARI_cluster,NMI_cluster_gt,ARI_cluster_gt, miscl_cluster, time_cluster] = testCluster(params,min, max, step, n_it, votingFun,syncVotingFun,datasetName,pi_gt,variableK)


N = params(1);
M = params(2);
K = params(3);
p = params(4);

acc_cluster = [];

NMI_cluster = [];
ARI_cluster = [];
NMI_cluster_gt = [];
ARI_cluster_gt = [];
time_cluster = [];

NMI_rel = [];
ACC_rel = [];

NMI_iteration_global = [];
NMI_iteration_gt_global = [];


% K = 3;
% N = 100;
% p = 0.9;
% DEBUG = true;
% step = 1;
% n_it = 50;
x_K = min:step:max;
for K =     min:+step:max


   [NMI_iteration_gt,ARI_iteration_gt,NMI_iteration, ARI_iteration, acc_iteration, time_iteration,ACC_rel_iteration] = execTestIteration([N, M,K,p],n_it, votingFun,syncVotingFun, pi_gt, variableK );

    NMI_cluster = [NMI_cluster, sum(NMI_iteration, 2)/n_it];
    ARI_cluster = [ARI_cluster, sum(ARI_iteration, 2)/n_it];

      NMI_iteration_global = [NMI_iteration_global, NMI_iteration];

    NMI_cluster_gt = [NMI_cluster_gt, sum(NMI_iteration_gt, 2)/n_it];
    ARI_cluster_gt = [ARI_cluster_gt, sum(ARI_iteration_gt, 2)/n_it];

        NMI_iteration_gt_global = [NMI_iteration_gt_global, NMI_iteration_gt];


    acc_cluster =  [acc_cluster, sum(acc_iteration,2)/n_it];

    time_cluster = [time_cluster, sum(time_iteration,2)/n_it];
        std_NMI = std(NMI_iteration,0,2);
        std_NMI_GT= std(NMI_iteration_gt,0,2);
        std_ARI = std(ARI_iteration,0,2);
        std_ARI_GT = std(ARI_iteration_gt,0,2);
        std_TIME = std(time_iteration,0,2);
        std_ACC= std(acc_iteration,0,2);
        std_ACC_REL = std(ACC_rel,0,2);
        save(strcat('testCluster_', func2str(votingFun), "_", datasetName));
end

         writematrix(std_NMI_GT,  strcat("../../Results/", datasetName,"/Clusters/STD_NMI_gt_", func2str(votingFun), "_", datasetName ));
        writematrix(std_NMI,  strcat("../../Results/", datasetName,"/Clusters/STD_NMI_", func2str(votingFun), "_", datasetName ));

        writematrix(std_ARI_GT,  strcat("../../Results/", datasetName,"/Clusters/STD_ARI_gt_", func2str(votingFun), "_", datasetName ));
        writematrix(std_ARI,  strcat("../../Results/", datasetName,"/Clusters/STD_ARI_", func2str(votingFun), "_", datasetName ));

        writematrix(std_ACC,  strcat("../../Results/", datasetName,"/Clusters/STD_ACC_", func2str(votingFun), "_", datasetName ));
        writematrix(std_TIME,  strcat("../../Results/", datasetName,"/Clusters/STD_time_", func2str(votingFun), "_", datasetName ));
        writematrix(std_ACC_REL,  strcat("../../Results/", datasetName,"/Clusters/STD_ACC_rel_", func2str(votingFun), "_", datasetName ));



        writematrix(NMI_cluster_gt,  strcat("../../Results/", datasetName,"/Clusters/NMI_cluster_gt_", func2str(votingFun), "_", datasetName ));
        writematrix(NMI_cluster,  strcat("../../Results/", datasetName,"/Clusters/NMI_cluster_", func2str(votingFun), "_", datasetName ));

        writematrix(ARI_cluster_gt,  strcat("../../Results/", datasetName,"/Clusters/ARI_cluster_gt_", func2str(votingFun), "_", datasetName ));
        writematrix(ARI_cluster,  strcat("../../Results/", datasetName,"/Clusters/ARI_cluster_", func2str(votingFun), "_", datasetName ));

        writematrix(acc_cluster,  strcat("../../Results/", datasetName,"/Clusters/acc_cluster_", func2str(votingFun), "_", datasetName ));
        writematrix(time_cluster,  strcat("../../Results/", datasetName,"/Clusters/time_cluster_", func2str(votingFun), "_", datasetName ));
        writematrix(ACC_rel,  strcat("../../Results/", datasetName,"/Clusters/ACC_cluster_rel_", func2str(votingFun), "_", datasetName ));

        writematrix(NMI_iteration_global,  strcat("../../Results/", datasetName,"/Clusters/Iteration/NMI_iteration_", func2str(votingFun), "_", datasetName, "_", int2str(n_it) ));
        writematrix(NMI_iteration_gt_global,  strcat("../../Results/", datasetName,"/Clusters/Iteration/NMI_iteration_gt_", func2str(votingFun), "_", datasetName,"_", int2str(n_it) ));

    

