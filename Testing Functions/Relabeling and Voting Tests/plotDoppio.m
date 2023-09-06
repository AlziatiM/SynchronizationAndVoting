
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

% path = "results";
 path = "RISULTATI DEF/Results CON NMF 1 E 0.4 SYNT";
 pathCESHL = 'results';
time_partition_relabelAndVote = readmatrix(strcat("../../", path,"/GaussianSynth/Partitions/time_partition_relabelAndVote_GaussianSynth.txt"));
NMI_partition_relabelAndVote = readmatrix(strcat("../../", path,"/GaussianSynth/Partitions/NMI_partition_relabelAndVote_GaussianSynth.txt"));
time_partition_relabelAndVoteCESHL = readmatrix(strcat("../../", pathCESHL,"/GaussianSynth/Partitions/time_partition_relabelAndVote_GaussianSynth.txt"));
NMI_partition_relabelAndVoteCESHL = readmatrix(strcat("../../", pathCESHL,"/GaussianSynth/Partitions/NMI_partition_relabelAndVote_GaussianSynth.txt"));


variableK = true;
% Hung
% regression 
% Mcla
% NMF
% Quickshift 
% cspa
% Random
% Pachauri




legendLabel = {'Hungarian', 'Regression','MCLA', 'CESHL', 'SV-NMF 1.0','SV-NMF 0.4', 'CSPA', 'Random'};


BoldLines = [5,6];
tiledlayout(1,2)


%%%%%%%%%%%%%%%%%%%%%%%%%PARTITIONS%%%%%%%%%%%%%%%%%%%%%%
% x_m= readmatrix("../../IMAGES/x_m.txt");
time_partition_relabelAndVote = [time_partition_relabelAndVote(1:3,:); time_partition_relabelAndVoteCESHL; time_partition_relabelAndVote(3+1:end,:)];
x_m = [10:+10:100];
matrixToPrint ={time_partition_relabelAndVote};
titles = ["TIME [Simple Voting]"];
y = ["time (Seconds)"];
 nexttile
plotMatrixList(x_m,matrixToPrint, titles, {},"# of partitions", y, true, BoldLines);

x_m= [10:10:100];
NMI_partition_relabelAndVote = [NMI_partition_relabelAndVote(1:3,:); NMI_partition_relabelAndVoteCESHL; NMI_partition_relabelAndVote(3+1:end,:)];
matrixToPrint ={NMI_partition_relabelAndVote};
titles = ["ANMI [SIMPLE VOTING]"];
y = ["ANMI"];
nexttile
plotMatrixList(x_m,matrixToPrint, titles, {},"# of partitions", y, false, BoldLines);


l = legend(legendLabel,'Orientation','horizontal', 'FontSize', 12);
l.Layout.Tile = 'north';

