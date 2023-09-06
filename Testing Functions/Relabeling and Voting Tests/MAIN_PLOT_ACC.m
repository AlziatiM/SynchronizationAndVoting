close all
path = "RISULTATI DEF\Results SINTETICI K FISSO";





acc_partition_relabelAndVote = readmatrix(strcat("../../", path,"/GaussianSynth/Partitions/acc_partition_relabelAndVote_GaussianSynth.txt"));
acc_partition_weightedVoting_simple = readmatrix(strcat("../../", path,"/GaussianSynth/Partitions/acc_partition_weightedVoting_simple_GaussianSynth.txt"));
acc_partition_weightedVoting_average = readmatrix(strcat("../../", path,"/GaussianSynth/Partitions/acc_partition_weightedVoting_average_GaussianSynth.txt"));



legendLabel = {'Hungarian', 'Regression','Mcla', 'NMF','QuickShift' , 'Cspa', 'Pachauri'};

BoldLines = [4,5,8];
tiledlayout(1,3)
%%%%%%%%%%%%%%%%%%%%PARTITIONS%%%%%%%%%%%%%%%%%%%%%%%%
x_m= [10:10:100];

matrixToPrint ={acc_partition_relabelAndVote};
titles = ["ACCURACY [SIMPLE VOTING]"];
y = ["accuracy"];
nexttile
plotMatrixList(x_m,matrixToPrint, titles, {},"# of partitions", y, false, BoldLines);

matrixToPrint ={acc_partition_weightedVoting_simple};
titles = ["ACCURACY [WEIGHTED VOTING-SIMPLE]"];
y = ["accuracy"];
nexttile
plotMatrixList(x_m,matrixToPrint, titles, {},"# of partitions", y, false, BoldLines);

matrixToPrint ={acc_partition_weightedVoting_average};
titles = ["ACCURACY [WEIGHTED VOTING-AVERAGE]"];
y = ["accuracy"];
nexttile
plotMatrixList(x_m,matrixToPrint, titles, {},"# of partitions", y, false, BoldLines);


% %%%%%%%%%%%%%%%%%%%%CLUSTERS%%%%%%%%%%%%%%%%%%%%%%%%
% x_k = [2:1:10];
% 
% matrixToPrint ={NMI_cluster_relabelAndVote};
% titles = ["Average accuracy wrt the GT with different number of Clusters [SIMPLE VOTING]"];
% y = ["accuracy"];
% plotMatrixList(x_k,matrixToPrint, titles, legend,"# of Clusters", y);
% 
% matrixToPrint ={NMI_cluster_weightedVoting_simple};
% titles = ["Average accuracy wrt the GT with different number of Clusters [WEIGHTED VOTING-SIMPLE]"];
% y = ["accuracy"];
% plotMatrixList(x_k,matrixToPrint, titles, legend,"# of Clusters", y);
% 
% matrixToPrint ={NMI_cluster_weightedVoting_average};
% titles = ["Average accuracy wrt the GT with different number of Clusters [WEIGHTED VOTING-AVERAGE]"];
% y = ["accuracy"];
% plotMatrixList(x_k,matrixToPrint, titles, legend,"# of Clusters", y);


























% legend = ["Hungarian", "Regression", "Matchpairs","Jonker-Volgenant", "Mcla", "Sync",   "Cspa"];
% 
% 
% 
% 
% x_m = [10:+10:80];
% legend = ["Hungarian", "Regression", "Matchpairs","Jonker-Volgenant", "Mcla", "Sync",   "Cspa"];
% matrixToPrint ={acc_partition_relabelAndVote};
% titles = ["Average time  with different number of partitions"];
% y = ["time (Seconds)"];
% plotMatrixList(x_m,matrixToPrint, titles, legend,"# of partitions", y, true);
% 
% %%%%%%%%%%%%%%%%%%%%CLUSTERS%%%%%%%%%%%%%%%%%%%%%%%%
% % x_k = readmatrix("../../IMAGES/x_k.txt");
% x_k = [2:15];
% matrixToPrint ={acc_cluster_relabelAndVote_20};
% titles = ["Average acc wrt the GT with different number of Clusters [M = 20"];
% y = ["Classification Accuracy"];
% plotMatrixList(x_k,matrixToPrint, titles, legend,"# of Clusters", y, true);
% 
% matrixToPrint ={acc_cluster_relabelAndVote_50};
% titles = ["Average acc wrt the GT with different number of Clusters [M = 50"];
% y = ["Classification Accuracy"];
% plotMatrixList(x_k,matrixToPrint, titles, legend,"# of Clusters", y, true);
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
% %%%%%%%%%%%%%%%%%%%%%NOISE-S.V.%%%%%%%%%%%%%%%%%%%%%%%%%
% x_p = readmatrix("../../IMAGES/x_p.txt");
% 
% matrixToPrint ={acc_noise_relabelAndVote_K2};
% titles = ["Average acc wrt the GT with noise variation [K = 2] [SIMPLE VOTING]"];
% y = ["acc"];
% plotMatrixList(x_p,matrixToPrint, titles, legend,"% of correctly labelled points", y);
% 
% 
% % legend = ["Hungarian", "Regression", "Matchpairs","Jonker-Volgenant", "Mcla", "Sync"];
% matrixToPrint ={acc_noise_relabelAndVote_K3};
% titles = ["Average acc wrt the GT with noise variation [K = 3] [SIMPLE VOTING]"];
% y = ["acc"];
% plotMatrixList(x_p,matrixToPrint, titles, legend,"% of correctly labelled points", y);
% 
% 
% 
% 
% % legend = ["Hungarian", "Regression", "Matchpairs","Jonker-Volgenant", "Mcla", "Sync"];
% matrixToPrint ={acc_noise_relabelAndVote_K4};
% titles = ["Average acc wrt the GT with noise variation [K = 4] [SIMPLE VOTING]"];
% y = ["acc"];
% plotMatrixList(x_p,matrixToPrint, titles, legend,"% of correctly labelled points", y);
% 
% 
% % legend = ["Hungarian", "Regression", "Matchpairs","Jonker-Volgenant", "Mcla", "Sync"];
% matrixToPrint ={acc_noise_relabelAndVote_K5};
% titles = ["Average acc wrt the GT with noise variation [K = 5] [SIMPLE VOTING]"];
% y = ["acc"];
% plotMatrixList(x_p,matrixToPrint, titles, legend,"% of correctly labelled points", y);
% %%%%%%%%%%%%%%%%%%%%%NOISE-W.V.S.%%%%%%%%%%%%%%%%%%%%%%%%%
% matrixToPrint ={acc_noise_weightedVoting_simple_K2};
% titles = ["Average acc wrt the GT with noise variation [K = 2] [WEIGHTED VOTING -SIMPLE]"];
% y = ["acc"];
% plotMatrixList(x_p,matrixToPrint, titles, legend,"% of correctly labelled points", y);
% 
% 
% % legend = ["Hungarian", "Regression", "Matchpairs","Jonker-Volgenant", "Mcla", "Sync"];
% matrixToPrint ={acc_noise_weightedVoting_simple_K3};
% titles = ["Average acc wrt the GT with noise variation [K = 3] [WEIGHTED VOTING -SIMPLE]"];
% y = ["acc"];
% plotMatrixList(x_p,matrixToPrint, titles, legend,"% of correctly labelled points", y);
% 
% 
% 
% 
% % legend = ["Hungarian", "Regression", "Matchpairs","Jonker-Volgenant", "Mcla", "Sync"];
% matrixToPrint ={acc_noise_weightedVoting_simple_K4};
% titles = ["Average acc wrt the GT with noise variation [K = 4] [WEIGHTED VOTING -SIMPLE]"];
% y = ["acc"];
% plotMatrixList(x_p,matrixToPrint, titles, legend,"% of correctly labelled points", y);
% 
% 
% % legend = ["Hungarian", "Regression", "Matchpairs","Jonker-Volgenant", "Mcla", "Sync"];
% matrixToPrint ={acc_noise_weightedVoting_simple_K5};
% titles = ["Average acc wrt the GT with noise variation [K = 5] [WEIGHTED VOTING -SIMPLE]"];
% y = ["acc"];
% plotMatrixList(x_p,matrixToPrint, titles, legend,"% of correctly labelled points", y);
% 
% 
% %%%%%%%%%%%%%%%%%%%%%NOISE-W.V.A.%%%%%%%%%%%%%%%%%%%%%%%%%
% matrixToPrint ={acc_noise_weightedVoting_average_K2};
% titles = ["Average acc wrt the GT with noise variation [K = 2] [WEIGHTED VOTING -AVERAGE]"];
% y = ["acc"];
% plotMatrixList(x_p,matrixToPrint, titles, legend,"% of correctly labelled points", y);
% 
% 
% % legend = ["Hungarian", "Regression", "Matchpairs","Jonker-Volgenant", "Mcla", "Sync"];
% matrixToPrint ={acc_noise_weightedVoting_average_K3};
% titles = ["Average acc wrt the GT with noise variation [K = 3] [WEIGHTED VOTING -AVERAGE]"];
% y = ["acc"];
% plotMatrixList(x_p,matrixToPrint, titles, legend,"% of correctly labelled points", y);
% 
% 
% 
% 
% % legend = ["Hungarian", "Regression", "Matchpairs","Jonker-Volgenant", "Mcla", "Sync"];
% matrixToPrint ={acc_noise_weightedVoting_average_K4};
% titles = ["Average acc wrt the GT with noise variation [K = 4] [WEIGHTED VOTING - AVERAGE]"];
% y = ["acc"];
% plotMatrixList(x_p,matrixToPrint, titles, legend,"% of correctly labelled points", y);
% 
% 
% % legend = ["Hungarian", "Regression", "Matchpairs","Jonker-Volgenant", "Mcla", "Sync"];
% matrixToPrint ={acc_noise_weightedVoting_average_K5};
% titles = ["Average acc wrt the GT with noise variation [K = 5] [WEIGHTED VOTING -AVERAGE]"];
% y = ["acc"];
% plotMatrixList(x_p,matrixToPrint, titles, legend,"% of correctly labelled points", y);
% 
% %%%%%%%%%%%%%%%%%%%%PARTITIONS%%%%%%%%%%%%%%%%%%%%%%%%
% x_m= readmatrix("../../IMAGES/x_m.txt");
% 
% % legend = ["Hungarian", "Regression", "Matchpairs","Jonker-Volgenant", "Mcla", "Sync"];
% matrixToPrint ={acc_partition_relabelAndVote};
% titles = ["Average acc wrt the GT with different number of partitions [SIMPLE VOTING]"];
% y = ["acc"];
% plotMatrixList(x_m,matrixToPrint, titles, legend,"# of partitions", y);
% 
% % legend = ["Hungarian", "Regression", "Matchpairs","Jonker-Volgenant", "Mcla", "Sync"];
% matrixToPrint ={acc_partition_weightedVoting_simple};
% titles = ["Average acc wrt the GT with different number of partitions [WEIGHTED VOTING-SIMPLE]"];
% y = ["acc"];
% plotMatrixList(x_m,matrixToPrint, titles, legend,"# of partitions", y);
% 
% % legend = ["Hungarian", "Regression", "Matchpairs","Jonker-Volgenant", "Mcla", "Sync"];
% matrixToPrint ={acc_partition_weightedVoting_average};
% titles = ["Average acc wrt the GT with different number of partitions [WEIGHTED VOTING-AVERAGE]"];
% y = ["acc"];
% plotMatrixList(x_m,matrixToPrint, titles, legend,"# of partitions", y);
% 
% 
% %%%%%%%%%%%%%%%%%%%%CLUSTERS%%%%%%%%%%%%%%%%%%%%%%%%
% x_k = readmatrix("../../IMAGES/x_k.txt");
% 
% % legend = ["Hungarian", "Regression", "Matchpairs","Jonker-Volgenant", "Mcla", "Sync"];
% matrixToPrint ={acc_cluster_relabelAndVote};
% titles = ["Average acc wrt the GT with different number of Clusters [SIMPLE VOTING]"];
% y = ["acc"];
% plotMatrixList(x_k,matrixToPrint, titles, legend,"# of Clusters", y);
% 
% % legend = ["Hungarian", "Regression", "Matchpairs","Jonker-Volgenant", "Mcla", "Sync"];
% matrixToPrint ={acc_cluster_weightedVoting_simple};
% titles = ["Average acc wrt the GT with different number of Clusters [WEIGHTED VOTING-SIMPLE]"];
% y = ["acc"];
% plotMatrixList(x_k,matrixToPrint, titles, legend,"# of Clusters", y);
% 
% % legend = ["Hungarian", "Regression", "Matchpairs","Jonker-Volgenant", "Mcla", "Sync"];
% matrixToPrint ={acc_cluster_weightedVoting_average};
% titles = ["Average acc wrt the GT with different number of Clusters [WEIGHTED VOTING-AVERAGE]"];
% y = ["acc"];
% plotMatrixList(x_k,matrixToPrint, titles, legend,"# of Clusters", y);
% 
% %%%%%%%%%%%%%%%%%%%%POINTS%%%%%%%%%%%%%%%%%%%%%%%%
% % x_pnts = readmatrix("../../IMAGES/x_pnts.txt");
% % 
% % legend = ["Hungarian", "Regression", "Matchpairs","Jonker-Volgenant", "Mcla", "Sync"];
% % matrixToPrint ={acc_points_relabelAndVote};
% % titles = ["Average acc wrt the GT with different number of points [SIMPLE VOTING]"];
% % y = ["acc"];
% % plotMatrixList(x_pnts,matrixToPrint, titles, legend,"# of points", y);
% % 
% % legend = ["Hungarian", "Regression", "Matchpairs","Jonker-Volgenant", "Mcla", "Sync"];
% % matrixToPrint ={acc_points_weightedVoting_simple};
% % titles = ["Average acc wrt the GT with different number of points [WEIGHTED VOTING-SIMPLE]"];
% % y = ["acc"];
% % plotMatrixList(x_pnts,matrixToPrint, titles, legend,"# of points", y);
% % 
% % legend = ["Hungarian", "Regression", "Matchpairs","Jonker-Volgenant", "Mcla", "Sync"];
% % matrixToPrint ={acc_points_weightedVoting_average};
% % titles = ["Average acc wrt the GT with different number of points [WEIGHTED VOTING-AVERAGE]"];
% % y = ["acc"];
% % plotMatrixList(x_pnts,matrixToPrint, titles, legend,"# of points", y);
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%VOTING%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% 
% legendNames = ["Simple Voting", "Simple acc Weighting", "Average acc Weighting"];
% matrixToPrint ={acc_noise_relabelAndVote_K3,acc_noise_weightedVoting_simple_K3,acc_noise_weightedVoting_average_K3};
% %DA SCOMMENTARE CON NUOVI TEST
%  titles = ["Comparison of Hungarian relabeling with different voting method", 
%     "Comparison of Regression relabeling with different voting method" ,
%     "Comparison of matchpairs relabeling with different voting method",
%     "Comparison of Jonker-Volgenant relabeling with different voting method",
%     "Comparison of MCLA relabeling with different voting method",
%         "Comparison of sync relabeling with different voting method",
% ];
% 
% 
% y = ["acc", "acc", "acc", "acc", "acc", "acc"];
% plotMatrixRows(x_p,matrixToPrint,titles,legendNames,"% of correctly labelled points",y);
% 
% 
% 
% 
% matrixToPrint ={acc_partition_relabelAndVote,acc_partition_weightedVoting_simple,acc_partition_weightedVoting_average};
% plotMatrixRows(x_m,matrixToPrint,titles,legendNames,"# of partitions",y);
% 
% matrixToPrint ={acc_cluster_relabelAndVote,acc_cluster_weightedVoting_simple,acc_cluster_weightedVoting_average};
% plotMatrixRows(x_k,matrixToPrint,titles,legendNames,"# of clusters",y);
% 
% % matrixToPrint ={acc_points_relabelAndVote,acc_points_weightedVoting_simple,acc_points_weightedVoting_average};
% % plotMatrixRows(x_pnts,matrixToPrint,titles,legendNames,"# of points",y);
% 
% 
