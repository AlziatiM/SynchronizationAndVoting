function statisticsMethodsDataset( datasetName,  votingFun)

folder = "Results";
matrixToTest = readmatrix(strcat("../../",folder,"/",datasetName,"/Partitions/Iteration/NMI_iteration_", func2str(votingFun), "_", datasetName, "_", "50" ));

variableK = true;
% Hung
% regression 
% Mcla
% NMF
% Quickshift 
% cspa
% Random
% Pachauri

% 
% Iris: statisticamente peggio di MCLA
% Segm: comparabile Hung, MCLA 
% Isolet: comparabile MCLA, meglio di altri
% MF: comparabile Hung, meglio di Altri
% Usps: statisticamente meglio di MCLA, comaprabile Hung e regr
% 
% Mnist: comparabile Hung e MCLa, statisticamente meglio di altri
% Wine: statisticamente meglio di CSPA e MCLA , comparabile altri
% Silhouette: comparabile tutto, statisticamente meglio di MCLA e random
% Lung: meglio di regr, CSPA e random, comparabile altri

% RANKSUM: H_0 significa che provengono dalla stessa distribuzione 
% SIGNRANK: H_0 significa che la differenza ha mediana nulla
% FRIEDMAN: h_0 SIGNIFICA CHE LE COLONNE HANNO LO STESSO EFFETTO SULLE RIGHE

if(size(matrixToTest, 1) > 7)
    variableK = false;
end

%%%%%%%%%%%%%%%%%%% NMF %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[p41,h41, stat41] = ranksum(matrixToTest(4,:), matrixToTest(1,:) );
[p42,h42, stat42] = ranksum(matrixToTest(4,:), matrixToTest(2,:) );
[p43,h43, stat43] = ranksum(matrixToTest(4,:), matrixToTest(3,:) );
[p45,h45, stat45] = ranksum(matrixToTest(4,:), matrixToTest(5,:) );
[p46,h46, stat46] = ranksum(matrixToTest(4,:), matrixToTest(6,:) );
[p47,h47, stat47] = ranksum(matrixToTest(4,:), matrixToTest(7,:) );
if ~variableK
    [p48,h48, stat48] = ranksum(matrixToTest(4,:), matrixToTest(8,:) );
else
    p48 = [];
    h48 = [];
    stat48.ranksum = [];
end



pRanksumNMF = [ p41;p42;p43;p45;p46;p47;p48];
hRanksumNMF = [ h41;h42;h43;h45;h46;h47;h48];
statRanksumNMF = [stat41.ranksum;stat42.ranksum;stat43.ranksum;stat45.ranksum;stat46.ranksum;stat47.ranksum;stat48.ranksum];

% writematrix(pRanksumNMF,  strcat("../../Results/", datasetName,"/Statistics/NMF/p_", saveName,"_" ,datasetName, "_", votingFun ));
% writematrix(hRanksumNMF,  strcat("../../Results/", datasetName,"/Statistics/NMF/h_", saveName,"_" ,datasetName, "_", votingFun  ));
% writematrix(statRanksumNMF,  strcat("../../Results/", datasetName,"/Statistics/NMF/rank_", saveName,"_" ,datasetName, "_", votingFun  ));

%%%%%%%%%%%%%%%%%%% QUICKSHIFT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[p51,h51, stat51] = ranksum(matrixToTest(5,:), matrixToTest(1,:) );
[p52,h52, stat52] = ranksum(matrixToTest(5,:), matrixToTest(2,:) );
[p53,h53, stat53] = ranksum(matrixToTest(5,:), matrixToTest(3,:) );
[p54,h54, stat54] = ranksum(matrixToTest(5,:), matrixToTest(4,:) );
[p56,h56, stat56] = ranksum(matrixToTest(5,:), matrixToTest(6,:) );
[p57,h57, stat57] = ranksum(matrixToTest(5,:), matrixToTest(7,:) );
if ~variableK
    [p58,h58, stat58] = ranksum(matrixToTest(5,:), matrixToTest(8,:) );
else
    p58 = [];
    h58 = [];
    stat58.ranksum = [];
end



pRanksumQS = [ p51;p52;p53;p54;p56;p57;p58];
hRanksumQS = [ h51;h52;h53;h54;h56;h57;h58];
statRanksumQS = [stat51.ranksum;stat52.ranksum;stat53.ranksum;stat54.ranksum;stat56.ranksum;stat57.ranksum;stat58.ranksum];
% 
% writematrix(pRanksumQS,  strcat("../../Results/", datasetName,"/Statistics/QuickShift/p_", saveName,"_" ,datasetName, "_", votingFun ));
% writematrix(hRanksumQS,  strcat("../../Results/", datasetName,"/Statistics/QuickShift/h_", saveName,"_" ,datasetName, "_", votingFun  ));
% writematrix(statRanksumQS,  strcat("../../Results/", datasetName,"/Statistics/QuickShift/rank_", saveName,"_" ,datasetName, "_", votingFun  ));






if ~variableK
%%%%%%%%%%%%%%%%%%% PACHAURI %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[p81,h81, stat81] = ranksum(matrixToTest(8,:), matrixToTest(1,:) );
[p82,h82, stat82] = ranksum(matrixToTest(8,:), matrixToTest(2,:) );
[p83,h83, stat83] = ranksum(matrixToTest(8,:), matrixToTest(3,:) );
[p84,h84, stat84] = ranksum(matrixToTest(8,:), matrixToTest(4,:) );
[p85,h85, stat85] = ranksum(matrixToTest(8,:), matrixToTest(5,:) );
[p86,h86, stat86] = ranksum(matrixToTest(8,:), matrixToTest(6,:) );
[p87,h87, stat87] = ranksum(matrixToTest(8,:), matrixToTest(7,:) );




pRanksumP = [ p81;p82;p83;p84;p85;p86;p87];
hRanksumP = [ h81;h82;h83;h84;h85;h86;h87];
statRanksumP = [stat81.ranksum;stat82.ranksum;stat83.ranksum;stat84.ranksum;stat85.ranksum;stat86.ranksum;stat87.ranksum];
end
% 
% writematrix(pRanksumP,  strcat("../../Results/", datasetName,"/Statistics/Pachauri/p_", saveName,"_" ,datasetName, "_", votingFun ));
% writematrix(hRanksumP,  strcat("../../Results/", datasetName,"/Statistics/Pachauri/h_", saveName,"_" ,datasetName, "_", votingFun  ));
% writematrix(statRanksumP,  strcat("../../Results/", datasetName,"/Statistics/Pachauri/rank_", saveName,"_" ,datasetName, "_", votingFun  ));
end

