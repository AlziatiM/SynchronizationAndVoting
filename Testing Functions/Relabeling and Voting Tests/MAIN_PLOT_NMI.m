close all
% path = "RISULTATI DEF\Results SINTETICI K FISSO";
path = "RISULTATI DEF\Results SINTETICI K VARIABILE";

% NMI_partition_gt_relabelAndVote = readmatrix(strcat("../../", path,"/GaussianSynth/Partitions/NMI_partition_gt_relabelAndVote_GaussianSynth.txt"));
% NMI_partition_gt_weightedVoting_simple = readmatrix(strcat("../../", path,"/GaussianSynth/Partitions/NMI_partition_gt_weightedVoting_simple_GaussianSynth.txt"));
% NMI_partition_gt_weightedVoting_average = readmatrix(strcat("../../", path,"/GaussianSynth/Partitions/NMI_partition_gt_weightedVoting_average_GaussianSynth.txt"));


% NMI_points_gt_relabelAndVote = readmatrix("../../IMAGES/Points/NMI_points_gt_relabelAndVote.txt");
% NMI_points_gt_weightedVoting_simple = readmatrix("../../IMAGES/Points/NMI_points_gt_weightedVoting_simple.txt");
% NMI_points_gt_weightedVoting_average = readmatrix("../../IMAGES/Points/NMI_points_gt_weightedVoting_average.txt");
% 
% NMI_noise_relabelAndVote = readmatrix("../../Results/GaussianSynth/Noise/NMI_noise_relabelAndVote_GaussianSynth.txt");
% NMI_noise_weightedVoting_simple = readmatrix("../../Results/GaussianSynth/Noise/NMI_noise_weightedVoting_simple_GaussianSynth.txt");
% NMI_noise_weightedVoting_average= readmatrix("../../Results/GaussianSynth/Noise/NMI_noise_weightedVoting_average_GaussianSynth.txt");
% 
% 
% NMI_noiseSync_relabelAndVote = readmatrix("../../Results/GaussianSynth/NoiseSync/NMI_noise_relabelAndVote_GaussianSynth.txt");
% NMI_noiseSync_weightedVoting_simple = readmatrix("../../Results/GaussianSynth/NoiseSync/NMI_noise_weightedVoting_simple_GaussianSynth.txt");
% NMI_noiseSync_weightedVoting_average= readmatrix("../../Results/GaussianSynth/NoiseSync/NMI_noise_weightedVoting_average_GaussianSynth.txt");
% 
% 
% 
NMI_partition_relabelAndVote = readmatrix(strcat("../../", path,"/GaussianSynth/Partitions/NMI_partition_relabelAndVote_GaussianSynth.txt"));
NMI_partition_weightedVoting_simple = readmatrix(strcat("../../", path,"/GaussianSynth/Partitions/NMI_partition_weightedVoting_simple_GaussianSynth.txt"));
NMI_partition_weightedVoting_average = readmatrix(strcat("../../", path,"/GaussianSynth/Partitions/NMI_partition_weightedVoting_average_GaussianSynth.txt"));
% 
NMI_cluster_relabelAndVote = readmatrix("../../Results/GaussianSynth/Clusters/NMI_cluster_relabelAndVote_GaussianSynth.txt");
NMI_cluster_weightedVoting_simple = readmatrix("../../Results/GaussianSynth/Clusters/NMI_cluster_weightedVoting_simple_GaussianSynth.txt");
NMI_cluster_weightedVoting_average = readmatrix("../../Results/GaussianSynth/Clusters/NMI_cluster_weightedVoting_average_GaussianSynth.txt");

variableK = true;
% Hung
% regression 
% Mcla
% NMF
% Quickshift 
% cspa
% Random
% Pachauri

if(size(NMI_partition_relabelAndVote, 1) > 7)
    variableK = false;
end


legendLabel = {'Hungarian', 'Regression','Mcla', 'NMF','QuickShift' , 'Cspa','RandomPartition', 'Pachauri'};


BoldLines = [4,5,8];
tiledlayout(1,3)


%%%%%%%%%%%%%%%%%%%%%NOISE-S.V.%%%%%%%%%%%%%%%%%%%%%%%%%
% x_p = [0.3:0.1:1];% readmatrix("../../IMAGES/x_p.txt");
% 
% matrixToPrint ={NMI_noise_gt_relabelAndVote};
% titles = ["Average NMI wrt the GT with noise variation  [SIMPLE VOTING]"];
% y = ["NMI"];
% plotMatrixList(x_p,matrixToPrint, titles, legend,"% of correctly labelled points", y);
% 
% 
% matrixToPrint ={NMI_noise_gt_weightedVoting_simple};
% titles = ["Average NMI wrt the GT with noise variation  [WEIGHTED VOTING -SIMPLE]"];
% y = ["NMI"];
% plotMatrixList(x_p,matrixToPrint, titles, legend,"% of correctly labelled points", y);
% 
% 
% matrixToPrint ={NMI_noise_gt_weightedVoting_average};
% titles = ["Average NMI wrt the GT with noise variation  [WEIGHTED VOTING -AVERAGE]"];
% y = ["NMI"];
% plotMatrixList(x_p,matrixToPrint, titles, legend,"% of correctly labelled points", y);
% 
% % ------------------------------------------
% matrixToPrint ={NMI_noiseSync_gt_relabelAndVote};
% titles = ["Average NMI wrt the GT with noise Sync variation  [SIMPLE VOTING]"];
% y = ["NMI"];
% plotMatrixList(x_p,matrixToPrint, titles, legend,"% of correctly labelled points", y);
% 
% 
% matrixToPrint ={NMI_noiseSync_gt_weightedVoting_simple};
% titles = ["Average NMI wrt the GT with noise Sync variation  [WEIGHTED VOTING -SIMPLE]"];
% y = ["NMI"];
% plotMatrixList(x_p,matrixToPrint, titles, legend,"% of correctly labelled points", y);
% 
% 
% matrixToPrint ={NMI_noiseSync_gt_weightedVoting_average};
% titles = ["Average NMI wrt the GT with noise SYnc variation  [WEIGHTED VOTING -AVERAGE]"];
% y = ["NMI"];
% plotMatrixList(x_p,matrixToPrint, titles, legend,"% of correctly labelled points", y);
% 
% 
% 

%%%%%%%%%%%%%%%%%%%%PARTITIONS%%%%%%%%%%%%%%%%%%%%%%%%
x_m= [10:10:100];

matrixToPrint ={NMI_partition_relabelAndVote};
titles = ["ANMI [SIMPLE VOTING]"];
y = ["ANMI"];
nexttile
plotMatrixList(x_m,matrixToPrint, titles, {},"# of partitions", y, false, BoldLines);

matrixToPrint ={NMI_partition_weightedVoting_simple};
titles = ["ANMI [WEIGHTED VOTING-SIMPLE]"];
y = ["ANMI"];
nexttile
plotMatrixList(x_m,matrixToPrint, titles, {},"# of partitions", y, false, BoldLines);

matrixToPrint ={NMI_partition_weightedVoting_average};
titles = ["ANMI [WEIGHTED VOTING-AVERAGE]"];
y = ["ANMI"];
nexttile
plotMatrixList(x_m,matrixToPrint, titles, {},"# of partitions", y, false, BoldLines);

l = legend(legendLabel,'Orientation','horizontal', 'FontSize', 12);
 l.Layout.Tile = 'north';



 figure 
 tiledlayout(1,3)

% %%%%%%%%%%%%%%%%%%%%CLUSTERS%%%%%%%%%%%%%%%%%%%%%%%%
x_k = [3:1:20];

matrixToPrint ={NMI_cluster_relabelAndVote};
titles = ["ANMI [WEIGHTED VOTING-SIMPLE]"];
y = ["NMI"];
nexttile
plotMatrixList(x_k,matrixToPrint, titles, {},"# of Clusters", y, false, BoldLines);

matrixToPrint ={NMI_cluster_weightedVoting_simple};
titles = ["ANMI [WEIGHTED VOTING-SIMPLE]"];
y = ["NMI"];
nexttile
plotMatrixList(x_k,matrixToPrint, titles, {},"# of Clusters", y, false, BoldLines);

matrixToPrint ={NMI_cluster_weightedVoting_average};
titles = ["ANMI [WEIGHTED VOTING-AVERAGE]"];
y = ["NMI"];
nexttile
plotMatrixList(x_k,matrixToPrint, titles, {},"# of Clusters", y, false, BoldLines);

l = legend(legendLabel,'Orientation','horizontal', 'FontSize', 12);
 l.Layout.Tile = 'north';

% 
% %%%%%%%%%%%%%%%%%%%%%NOISE-S.V.%%%%%%%%%%%%%%%%%%%%%%%%%
% x_p = [0.3:0.1:1];% readmatrix("../../IMAGES/x_p.txt");
% 
% matrixToPrint ={NMI_noise_relabelAndVote};
% titles = ["Average NMI wrt the Ensemble with noise variation  [SIMPLE VOTING]"];
% y = ["NMI"];
% plotMatrixList(x_p,matrixToPrint, titles, legend,"% of correctly labelled points", y);
% 
% 
% matrixToPrint ={NMI_noise_weightedVoting_simple};
% titles = ["Average NMI wrt the Ensemble with noise variation  [WEIGHTED VOTING -SIMPLE]"];
% y = ["NMI"];
% plotMatrixList(x_p,matrixToPrint, titles, legend,"% of correctly labelled points", y);
% 
% 
% matrixToPrint ={NMI_noise_weightedVoting_average};
% titles = ["Average NMI wrt the Ensemble with noise variation  [WEIGHTED VOTING -AVERAGE]"];
% y = ["NMI"];
% plotMatrixList(x_p,matrixToPrint, titles, legend,"% of correctly labelled points", y);
% 
% %--------------------------------------
% matrixToPrint ={NMI_noiseSync_relabelAndVote};
% titles = ["Average NMI wrt the Ensemble with noise Sync variation  [SIMPLE VOTING]"];
% y = ["NMI"];
% plotMatrixList(x_p,matrixToPrint, titles, legend,"% of correctly labelled points", y);
% 
% 
% matrixToPrint ={NMI_noiseSync_weightedVoting_simple};
% titles = ["Average NMI wrt the Ensemble with noise Sync variation  [WEIGHTED VOTING -SIMPLE]"];
% y = ["NMI"];
% plotMatrixList(x_p,matrixToPrint, titles, legend,"% of correctly labelled points", y);
% 
% 
% matrixToPrint ={NMI_noiseSync_weightedVoting_average};
% titles = ["Average NMI wrt the Ensemble with noise Sync variation  [WEIGHTED VOTING -AVERAGE]"];
% y = ["NMI"];
% plotMatrixList(x_p,matrixToPrint, titles, legend,"% of correctly labelled points", y);
% 
% 
% 
% 
% 
% %%%%%%%%%%%%%%%%%%%%PARTITIONS%%%%%%%%%%%%%%%%%%%%%%%%
% x_m= [10:10:100];
% 
% matrixToPrint ={NMI_partition_relabelAndVote};
% titles = ["Average NMI wrt the Ensemble with different number of partitions [SIMPLE VOTING]"];
% y = ["NMI"];
% plotMatrixList(x_m,matrixToPrint, titles, legend,"# of partitions", y);
% 
% matrixToPrint ={NMI_partition_weightedVoting_simple};
% titles = ["Average NMI wrt the Ensemble with different number of partitions [WEIGHTED VOTING-SIMPLE]"];
% y = ["NMI"];
% plotMatrixList(x_m,matrixToPrint, titles, legend,"# of partitions", y);
% 
% matrixToPrint ={NMI_partition_weightedVoting_average};
% titles = ["Average NMI wrt the Ensemble with different number of partitions [WEIGHTED VOTING-AVERAGE]"];
% y = ["NMI"];
% plotMatrixList(x_m,matrixToPrint, titles, legend,"# of partitions", y);
% 
% 
% %%%%%%%%%%%%%%%%%%%%CLUSTERS%%%%%%%%%%%%%%%%%%%%%%%%
% x_k = [2:1:10];
% 
% matrixToPrint ={NMI_cluster_relabelAndVote};
% titles = ["Average NMI wrt the Ensemble with different number of Clusters [SIMPLE VOTING]"];
% y = ["NMI"];
% plotMatrixList(x_k,matrixToPrint, titles, legend,"# of Clusters", y);
% 
% matrixToPrint ={NMI_cluster_weightedVoting_simple};
% titles = ["Average NMI wrt the Ensemble with different number of Clusters [WEIGHTED VOTING-SIMPLE]"];
% y = ["NMI"];
% plotMatrixList(x_k,matrixToPrint, titles, legend,"# of Clusters", y);
% 
% matrixToPrint ={NMI_cluster_weightedVoting_average};
% titles = ["Average NMI wrt the Ensemble with different number of Clusters [WEIGHTED VOTING-AVERAGE]"];
% y = ["NMI"];
% plotMatrixList(x_k,matrixToPrint, titles, legend,"# of Clusters", y);
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 












% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%VOTING%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% 
% legendNames = ["Simple Voting", "Simple NMI Weighting", "Average NMI Weighting"];
% matrixToPrint ={NMI_noise_gt_relabelAndVote_K3,NMI_noise_gt_weightedVoting_simple_K3,NMI_noise_gt_weightedVoting_average_K3};
% titles = ["Comparison of Hungarian relabeling with different voting method", 
%     "Comparison of Regression relabeling with different voting method" ,
%     "Comparison of matchpairs relabeling with different voting method",
%     "Comparison of Jonker-Volgenant relabeling with different voting method",
%     "Comparison of MCLA relabeling with different voting method",
%         "Comparison of sync relabeling with different voting method",
% ];
% y = ["NMI", "NMI", "NMI", "NMI", "NMI", "NMI"];
% plotMatrixRows(x_p,matrixToPrint,titles,legendNames,"% of correctly labelled points",y);
% 
% 
% 
% 
% matrixToPrint ={NMI_partition_gt_relabelAndVote,NMI_partition_gt_weightedVoting_simple,NMI_partition_gt_weightedVoting_average};
% plotMatrixRows(x_m,matrixToPrint,titles,legendNames,"# of partitions",y);
% 
% matrixToPrint ={NMI_cluster_gt_relabelAndVote,NMI_cluster_gt_weightedVoting_simple,NMI_cluster_gt_weightedVoting_average};
% plotMatrixRows(x_k,matrixToPrint,titles,legendNames,"# of clusters",y);
% 
% % matrixToPrint ={NMI_points_gt_relabelAndVote,NMI_points_gt_weightedVoting_simple,NMI_points_gt_weightedVoting_average};
% % plotMatrixRows(x_pnts,matrixToPrint,titles,legendNames,"# of points",y);
% 
% 
