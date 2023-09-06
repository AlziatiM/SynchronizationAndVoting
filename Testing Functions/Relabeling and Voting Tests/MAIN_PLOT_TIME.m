
close all
% 
% time_noise_relabelAndVote = readmatrix("../../Results/GaussianSynth/Noise/time_noise_relabelAndVote_GaussianSynth.txt");
% time_noise_weightedVoting_simple = readmatrix("../../Results/GaussianSynth/Noise/time_noise_weightedVoting_simple_GaussianSynth.txt");
% time_noise_weightedVoting_average= readmatrix("../../Results/GaussianSynth/Noise/time_noise_weightedVoting_average_GaussianSynth.txt");
% % 
% time_noiseSync_relabelAndVote = readmatrix("../../Results/GaussianSynth/NoiseSync/time_noise_relabelAndVote_GaussianSynth.txt");
% time_noiseSync_weightedVoting_simple = readmatrix("../../Results/GaussianSynth/NoiseSync/time_noise_weightedVoting_simple_GaussianSynth.txt");
% time_noiseSync_weightedVoting_average= readmatrix("../../Results/GaussianSynth/NoiseSync/time_noise_weightedVoting_average_GaussianSynth.txt");
% 

 pathCESHL = "results";
 path = "RISULTATI DEF/Results SINTETICI K FISSO";

time_partition_relabelAndVote = readmatrix(strcat("../../", path,"/GaussianSynth/Partitions/time_partition_relabelAndVote_GaussianSynth.txt"));
time_partition_relabelAndVoteCESHL = readmatrix(strcat("../../", pathCESHL,"/GaussianSynth/Partitions/time_partition_relabelAndVote_GaussianSynth.txt"));

% time_partition_weightedVoting_simple = readmatrix(strcat("../../", path,"/GaussianSynth/Partitions/time_partition_weightedVoting_simple_GaussianSynth.txt"));
% time_partition_weightedVoting_average = readmatrix(strcat("../../", path,"/GaussianSynth/Partitions/time_partition_weightedVoting_average_GaussianSynth.txt"));

time_cluster_relabelAndVote = readmatrix(strcat("../../", path,"/GaussianSynth/Clusters/time_cluster_relabelAndVote_GaussianSynth.txt"));
time_cluster_relabelAndVoteCESHL = readmatrix(strcat("../../", pathCESHL,"/GaussianSynth/Clusters/time_cluster_relabelAndVote_GaussianSynth.txt"));

% time_cluster_weightedVoting_simple = readmatrix(strcat("../../", path,"/GaussianSynth/Clusters/time_cluster_weightedVoting_simple_GaussianSynth.txt"));
% time_cluster_weightedVoting_average = readmatrix(strcat("../../", path,"/GaussianSynth/Clusters/time_cluster_weightedVoting_average_GaussianSynth.txt"));


variableK = false;
% Hung
% regression 
% Mcla
% NMF
% Quickshift 
% cspa
% Random
% Pachauri

if(size(time_partition_relabelAndVote, 1) > 7)
    variableK = false;
end



% legendLabel = {'Hungarian', 'Regression','Mcla', 'NMF 1.0','NMF 0.4' , 'Cspa', 'Pachauri'};
%  legendLabel = {'Hungarian', 'Regression','Mcla', 'SV-NMF','SV-QM' , 'Cspa', 'SV-EIG'};
 legendLabel = {'Hungarian', 'Regression','MCLA','CESHL', 'SV-NMF', 'SV-QM' , 'CSPA' ,'SV-EIG'};


BoldLines = [5,6,8];
 tiledlayout(1,2)


%%%%%%%%%%%%%%%%%%%%%%%%%PARTITIONS%%%%%%%%%%%%%%%%%%%%%%

time_partition_relabelAndVote = [time_partition_relabelAndVote(1:3,:); time_partition_relabelAndVoteCESHL; time_partition_relabelAndVote(3+1:end,:)];

% x_m= readmatrix("../../IMAGES/x_m.txt");
x_m = [10:+10:100];
matrixToPrint ={time_partition_relabelAndVote};
titles = ["TIME [Simple Voting]"];
y = ["time (Seconds)"];
  nexttile
plotMatrixList(x_m,matrixToPrint, titles, {},"# of partitions", y, true, BoldLines);

% matrixToPrint ={time_partition_weightedVoting_simple};
% titles = ["TIME [Weighted Simple]"];
% y = ["time (Seconds)"];
% nexttile
% plotMatrixList(x_m,matrixToPrint, titles, {},"# of partitions", y, true, BoldLines);
% 
% matrixToPrint ={time_partition_weightedVoting_average};
% titles = ["TIME [Weighted Average]"];
% y = ["time (Seconds)"];
% nexttile
% plotMatrixList(x_m,matrixToPrint, titles, {},"# of partitions", y, true,BoldLines);


% [l, roba] = legend(legendLabel,'Orientation','horizontal', 'FontSize', 20);
% %  l.Layout.Tile = 'north';
% %             l.Location = "bestoutside";
% 
% l.Location = 'northoutside';
% objhl = findobj(roba,'type', 'line');
% set(objhl, 'Markersize', 15)
% figure
%  tiledlayout(1,2)

% %%%%%%%%%%%%%%%%%%%%CLUSTERS%%%%%%%%%%%%%%%%%%%%%%%%
% x_k = readmatrix("../../IMAGES/x_k.txt");
x_k = [3:20];
time_cluster_relabelAndVote = [time_cluster_relabelAndVote(1:3,:); time_cluster_relabelAndVoteCESHL; time_cluster_relabelAndVote(3+1:end,:)];

matrixToPrint ={time_cluster_relabelAndVote};
titles = ["TIME [Simple Voting]"];
y = ["time (Seconds)"];
 nexttile
plotMatrixList(x_k,matrixToPrint, titles, {},"# of Clusters", y, true, BoldLines);

% matrixToPrint ={time_cluster_weightedVoting_simple};
% titles = ["TIME [Weighted Simple]"];
% y = ["time"];
% nexttile
% plotMatrixList(x_k,matrixToPrint, titles, {},"# of Clusters", y, true, BoldLines);
% matrixToPrint ={time_cluster_weightedVoting_average};
% 
% titles = ["TIME [Weighted Average] "];
% y = ["time"];
% nexttile
% plotMatrixList(x_k,matrixToPrint, titles, {},"# of Clusters", y, true, BoldLines);
l = legend(legendLabel,'Orientation','horizontal', 'FontSize', 20);
  l.Layout.Tile = 'north';
% l.Location = 'northoutside';
% 
% 
% %%%%%%%%%%%%%%%%%%%%%NOISE-S.V.%%%%%%%%%%%%%%%%%%%%%%%%%
% x_p = [0.3:0.1:1];
% 
% matrixToPrint ={time_noise_relabelAndVote};
% titles = ["Average time with noise variation [Simple Voting]" ];
% y = ["time"];
% plotMatrixList(x_p,matrixToPrint, titles, legend,"% of correctly labelled points", y, true);
% 
% matrixToPrint ={time_noise_weightedVoting_simple};
% titles = ["Average time with noise variation [Weighted Simple]"];
% y = ["time"];
% plotMatrixList(x_p,matrixToPrint, titles, legend,"% of correctly labelled points", y, true);
% 
% matrixToPrint ={time_noise_weightedVoting_average};
% titles = ["Average time with noise variation [Weighted Average]"];
% y = ["time"];
% plotMatrixList(x_p,matrixToPrint, titles, legend,"% of correctly labelled points", y, true);
% 
% % ----------------------------------------
% matrixToPrint ={time_noiseSync_relabelAndVote};
% titles = ["Average time with noise sync variation [Simple Voting]" ];
% y = ["time"];
% plotMatrixList(x_p,matrixToPrint, titles, legend,"% of correctly labelled points", y, true);
% 
% matrixToPrint ={time_noiseSync_weightedVoting_simple};
% titles = ["Average time with noise aync variation [Weighted Simple]"];
% y = ["time"];
% plotMatrixList(x_p,matrixToPrint, titles, legend,"% of correctly labelled points", y, true);
% 
% matrixToPrint ={time_noiseSync_weightedVoting_average};
% titles = ["Average time with noise sync variation [Weighted Average]"];
% y = ["time"];
% plotMatrixList(x_p,matrixToPrint, titles, legend,"% of correctly labelled points", y, true);
% 
% 

