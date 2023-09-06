function MAIN_PLOT_NMI_DATASET(datasetName)

close all
path = "RISULTATI DEF\Results SINTETICI K FISSO";
% path = "RISULTATI DEF\Results SINTETICI K VARIABILE";

NMI_noiseSync_gt_relabelAndVote = readmatrix(strcat("../../",path,"/", datasetName,"/NoiseSync/NMI_noise_gt_relabelAndVote_",datasetName,".txt"));
NMI_noiseSync_gt_weightedVoting_simple = readmatrix(strcat("../../",path,"/", datasetName,"/NoiseSync/NMI_noise_gt_weightedVoting_simple_",datasetName,".txt"));
NMI_noiseSync_gt_weightedVoting_average= readmatrix(strcat("../../",path,"/", datasetName,"/NoiseSync/NMI_noise_gt_weightedVoting_average_",datasetName,".txt"));

NMI_noiseSync_relabelAndVote = readmatrix(strcat("../../",path,"/", datasetName,"/NoiseSync/NMI_noise_relabelAndVote_",datasetName,".txt"));
NMI_noiseSync_weightedVoting_simple = readmatrix(strcat("../../",path,"/", datasetName,"/NoiseSync/NMI_noise_weightedVoting_simple_",datasetName,".txt"));
NMI_noiseSync_weightedVoting_average= readmatrix(strcat("../../",path,"/", datasetName,"/NoiseSync/NMI_noise_weightedVoting_average_",datasetName,".txt"));

time_noiseSync_relabelAndVote = readmatrix(strcat("../../",path,"/", datasetName,"/NoiseSync/time_noise_relabelAndVote_",datasetName,".txt"));
time_noiseSync_weightedVoting_simple = readmatrix(strcat("../../",path,"/", datasetName,"/NoiseSync/time_noise_weightedVoting_simple_",datasetName,".txt"));
time_noiseSync_weightedVoting_average= readmatrix(strcat("../../",path,"/", datasetName,"/NoiseSync/time_noise_weightedVoting_average_",datasetName,".txt"));





legendLabel = { 'NMF', 'QuickShift', 'Pachauri'};
BoldLines = [1,2,3];
figure
tiledlayout(1,3)


%%%%%%%%%%%%%%%%%%%%%NOISE-S.V.%%%%%%%%%%%%%%%%%%%%%%%%%
x_p = [0.1:0.1:1];% readmatrix("../../IMAGES/x_p.txt");

% ------------------------------------------
matrixToPrint ={NMI_noiseSync_gt_relabelAndVote};
titles = ["NMI GT [SIMPLE VOTING]"];
y = ["NMI"];
nexttile
plotMatrixList(x_p,matrixToPrint, titles, {},"% of edges", y, false, BoldLines);


matrixToPrint ={NMI_noiseSync_gt_weightedVoting_simple};
titles = ["NMI GT [WEIGHTED VOTING - SIMPLE]"];
y = ["NMI"];
nexttile
plotMatrixList(x_p,matrixToPrint, titles, {},"% of edges", y, false, BoldLines);



matrixToPrint ={NMI_noiseSync_gt_weightedVoting_average};
titles = [ "NMI GT [WEIGHTED VOTING -AVERAGE]"];
y = ["NMI"];
nexttile
plotMatrixList(x_p,matrixToPrint, titles, {},"% of edges", y, false, BoldLines);

l = legend(legendLabel,'Orientation','horizontal', 'FontSize', 12);
 l.Layout.Tile = 'north';

figure 
tiledlayout(1,3)

%--------------------------------------
matrixToPrint ={NMI_noiseSync_relabelAndVote};
titles = [ "ANMI [SIMPLE VOTING]"];
y = ["NMI"];
nexttile
plotMatrixList(x_p,matrixToPrint, titles, {},"% of edges", y, false, BoldLines);



matrixToPrint ={NMI_noiseSync_weightedVoting_simple};
titles = ["ANMI [WEIGHTED VOTING -SIMPLE]"];
y = ["NMI"];
nexttile
plotMatrixList(x_p,matrixToPrint, titles, {},"% of edges", y, false, BoldLines);



matrixToPrint ={NMI_noiseSync_weightedVoting_average};
titles = ["ANMI [WEIGHTED VOTING -AVERAGE]"];
y = ["NMI"];

nexttile
plotMatrixList(x_p,matrixToPrint, titles, {},"% of edges", y, false, BoldLines);

l = legend(legendLabel,'Orientation','horizontal', 'FontSize', 12);
 l.Layout.Tile = 'north';

figure 
tiledlayout(1,3)
% --------------------------------------------------------------

matrixToPrint ={time_noiseSync_relabelAndVote};
titles = [ "TIME [SIMPLE VOTING]"];
y = ["time(Seconds)"];
nexttile
plotMatrixList(x_p,matrixToPrint, titles, {},"% of edges", y, true, BoldLines);



matrixToPrint ={time_noiseSync_weightedVoting_simple};
titles = ["TIME [WEIGHTED VOTING -SIMPLE]"];
y = ["time(Seconds)"];
nexttile
plotMatrixList(x_p,matrixToPrint, titles, {},"% of edges", y, true, BoldLines);



matrixToPrint ={time_noiseSync_weightedVoting_average};
titles = ["TIME [WEIGHTED VOTING -AVERAGE]"];
y = ["time(Seconds)"];
nexttile
plotMatrixList(x_p,matrixToPrint, titles, {},"% of edges", y, true, BoldLines);



l = legend(legendLabel,'Orientation','horizontal', 'FontSize', 12);
 l.Layout.Tile = 'north';



end