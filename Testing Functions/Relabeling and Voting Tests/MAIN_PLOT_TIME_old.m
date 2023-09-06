close all

time_noise_relabelAndVote = readmatrix("../../RISULTATI DEF/Results SYNT + REAL CON KMEANS/GaussianSynth/Noise/time_noise_relabelAndVote_GaussianSynth.txt");
time_noise_weightedVoting_simple = readmatrix("../../RISULTATI DEF/Results SYNT + REAL CON KMEANS/GaussianSynth/Noise/time_noise_weightedVoting_simple_GaussianSynth.txt");
time_noise_weightedVoting_average= readmatrix("../../RISULTATI DEF/Results SYNT + REAL CON KMEANS/GaussianSynth/Noise/time_noise_weightedVoting_average_GaussianSynth.txt");


time_partition_relabelAndVote = readmatrix("../../RISULTATI DEF/Results SYNT + REAL CON KMEANS/GaussianSynth/Partitions/time_partition_relabelAndVote_GaussianSynth.txt");
time_partition_weightedVoting_simple = readmatrix("../../RISULTATI DEF/Results SYNT + REAL CON KMEANS/GaussianSynth/Partitions/time_partition_weightedVoting_simple_GaussianSynth.txt");
time_partition_weightedVoting_average = readmatrix("../../RISULTATI DEF/Results SYNT + REAL CON KMEANS/GaussianSynth/Partitions/time_partition_weightedVoting_average_GaussianSynth.txt");

time_cluster_relabelAndVote = readmatrix("../../RISULTATI DEF/Results SYNT + REAL CON KMEANS/GaussianSynth/Clusters/time_cluster_relabelAndVote_GaussianSynth.txt");
time_cluster_weightedVoting_simple = readmatrix("../../RISULTATI DEF/Results SYNT + REAL CON KMEANS/GaussianSynth/Clusters/time_cluster_weightedVoting_simple_GaussianSynth.txt");
time_cluster_weightedVoting_average = readmatrix("../../RISULTATI DEF/Results SYNT + REAL CON KMEANS/GaussianSynth/Clusters/time_cluster_weightedVoting_average_GaussianSynth.txt");





legend = {'Hungarian', 'Regression', 'Matchpairs','Jonker-Volgenant', 'Mcla', 'Sync',    'Cspa','Random Partition'};



%%%%%%%%%%%%%%%%%%%%%%%%%PARTITIONS%%%%%%%%%%%%%%%%%%%%%%
% x_m= readmatrix("../../IMAGES/x_m.txt");
x_m = [10:+10:100];
matrixToPrint ={time_partition_relabelAndVote};
titles = ["Average time  with different number of partitions [Simple Voting]"];
y = ["time (Seconds)"];
plotMatrixList(x_m,matrixToPrint, titles, legend,"# of partitions", y, true);

matrixToPrint ={time_partition_weightedVoting_simple};
titles = ["Average time  with different number of partitions [Weighted Simple]"];
y = ["time (Seconds)"];
plotMatrixList(x_m,matrixToPrint, titles, legend,"# of partitions", y, true);

matrixToPrint ={time_partition_weightedVoting_average};
titles = ["Average time  with different number of partitions [Weighted Average]"];
y = ["time (Seconds)"];
plotMatrixList(x_m,matrixToPrint, titles, legend,"# of partitions", y, true);


%%%%%%%%%%%%%%%%%%%%%NOISE-S.V.%%%%%%%%%%%%%%%%%%%%%%%%%
x_p = [0.3:0.1:1];

matrixToPrint ={time_noise_relabelAndVote};
titles = ["Average time with noise variation [Simple Voting]" ];
y = ["time"];
plotMatrixList(x_p,matrixToPrint, titles, legend,"% of correctly labelled points", y, true);

matrixToPrint ={time_noise_weightedVoting_simple};
titles = ["Average time with noise variation [Weighted Simple]"];
y = ["time"];
plotMatrixList(x_p,matrixToPrint, titles, legend,"% of correctly labelled points", y, true);

matrixToPrint ={time_noise_weightedVoting_average};
titles = ["Average time with noise variation [Weighted Average]"];
y = ["time"];
plotMatrixList(x_p,matrixToPrint, titles, legend,"% of correctly labelled points", y, true);



%%%%%%%%%%%%%%%%%%%%CLUSTERS%%%%%%%%%%%%%%%%%%%%%%%%
% x_k = readmatrix("../../IMAGES/x_k.txt");
x_k = [2:10];
matrixToPrint ={time_cluster_relabelAndVote};
titles = ["Average time with different number of Clusters [Simple Voting] "];
y = ["time"];
plotMatrixList(x_k,matrixToPrint, titles, legend,"# of Clusters", y, true);

matrixToPrint ={time_cluster_weightedVoting_simple};
titles = ["Average time with different number of Clusters [Weighted Simple]"];
y = ["time"];

plotMatrixList(x_k,matrixToPrint, titles, legend,"# of Clusters", y, true);
matrixToPrint ={time_cluster_weightedVoting_average};

titles = ["Average time with different number of Clusters [Weighted Average] "];
y = ["time"];
plotMatrixList(x_k,matrixToPrint, titles, legend,"# of Clusters", y, true);


