function statisticsMethods(votingtype)

% RANKSUM: H_0 significa che provengono dalla stessa distribuzione
% SIGNRANK: H_0 significa che la differenza ha mediana nulla
% FRIEDMAN: h_0 SIGNIFICA CHE LE COLONNE HANNO LO STESSO EFFETTO SULLE RIGHE


close all
%  datasets ={'Iris', 'MF', 'Mnist', 'Usps', 'Isolet', 'Lung', 'Wine', 'Silhouette'};
% datasets ={'Iris', 'Lung', 'Wine', 'Silhouette'};
 datasets ={ 'MF', 'Mnist',  'Isolet'};

% TIME = [];
folder = "RISULTATI DEF/Results CON PACHAURI 0.5 K FISSO";
folderCESHL = "results";

% for i = 1: size(datasets, 2)
%  TIME = [TIME, readmatrix(strcat("../..//",folder,"/",datasets{i},"/Partitions/time_partition_",votingtype, "_", datasets{i},".txt"))];
% end
%


% ACC = [];
% for i = 1: size(datasets, 2)
%  ACC = [ACC, readmatrix(strcat("../../",folder,"/",datasets{i},"/Partitions/Iteration/ACC_iteration_",votingtype, "_", datasets{i},"_20.txt"))];
% end




NMI = [];
for i = 1: size(datasets, 2)
    NMI = [NMI, readmatrix(strcat("../../",folder,"/",datasets{i},"/Partitions/Iteration/NMI_iteration_",votingtype, "_", datasets{i},"_20.txt"))];
end

NMI_GT = [];
for i = 1: size(datasets, 2)
    NMI_GT = [NMI_GT, readmatrix(strcat("../../",folder,"/",datasets{i},"/Partitions/Iteration/NMI_iteration_gt_",votingtype, "_", datasets{i},"_20.txt"))];
end

% ARI = [];
% for i = 1: size(datasets, 2)
%  ARI = [ARI, readmatrix(strcat("../../",folder,"/",datasets{i},"/Partitions/Iteration/ARI_iteration_",votingtype, "_", datasets{i},"_20.txt"))];
% end
%
% ARI_GT = [];
% for i = 1: size(datasets, 2)
%  ARI_GT = [ARI_GT, readmatrix(strcat("../../",folder,"/",datasets{i},"/Partitions/Iteration/ARI_iteration_gt_",votingtype, "_", datasets{i},"_20.txt"))];
% end
NMI_CESHL = [];
ARI_CESHL = [];
for i = 1: size(datasets, 2)
    m = readmatrix(strcat("../../",folderCESHL,"/",datasets{i},"/Partitions/Iteration/NMI_iteration_",votingtype, "_", datasets{i},"_50.txt"));
    NMI_CESHL =[NMI_CESHL, m(1:20)];
    %         ARI_CESHL =[ARI_CESHL, readmatrix(strcat("../../",folderCESHL,"/",datasets{i},"/Partitions/Iteration/NMI_iteration_",votingtype, "_", datasets{i},"_20.txt"))];
end

for i = 1: 3

    NMI=    [NMI;NMI_CESHL];
    % ARI = [ARI,ARI_CESHL];
end




matrixToTest = NMI;


variableK = false;
% Hung
% regression
% Mcla
% NMF
% Quickshift
% cspa
% Random
% Pachauri


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
    [p49,h49, stat49] = ranksum(matrixToTest(4,:), matrixToTest(9,:) );

else
    p48 = [];
    h48 = [];
    stat48.ranksum = [];
end



pRanksumNMF = [ p41;p42;p43;p45;p46;p47;p48;p49];
hRanksumNMF = [ h41;h42;h43;h45;h46;h47;h48;h49];
statRanksumNMF = [stat41.ranksum;stat42.ranksum;stat43.ranksum;stat45.ranksum;stat46.ranksum;stat47.ranksum;stat48.ranksum;stat49.ranksum];


%%%%%%%%%%%%%%%%%%% QUICKSHIFT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[p51,h51, stat51] = ranksum(matrixToTest(5,:), matrixToTest(1,:) );
[p52,h52, stat52] = ranksum(matrixToTest(5,:), matrixToTest(2,:) );
[p53,h53, stat53] = ranksum(matrixToTest(5,:), matrixToTest(3,:) );
[p54,h54, stat54] = ranksum(matrixToTest(5,:), matrixToTest(4,:) );
[p56,h56, stat56] = ranksum(matrixToTest(5,:), matrixToTest(6,:) );
[p57,h57, stat57] = ranksum(matrixToTest(5,:), matrixToTest(7,:) );

if ~variableK
    [p58,h58, stat58] = ranksum(matrixToTest(5,:), matrixToTest(8,:) );
    [p59,h59, stat59] = ranksum(matrixToTest(5,:), matrixToTest(9,:) );

else
    p58 = [];
    h58 = [];
    stat58.ranksum = [];
end



pRanksumQS = [ p51;p52;p53;p54;p56;p57;p58;p59];
hRanksumQS = [ h51;h52;h53;h54;h56;h57;h58;h59];
statRanksumQS = [stat51.ranksum;stat52.ranksum;stat53.ranksum;stat54.ranksum;stat56.ranksum;stat57.ranksum;stat58.ranksum;stat59.ranksum];




if ~variableK
    %%%%%%%%%%%%%%%%%%% PACHAURI %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    [p81,h81, stat81] = ranksum(matrixToTest(8,:), matrixToTest(1,:) );
    [p82,h82, stat82] = ranksum(matrixToTest(8,:), matrixToTest(2,:) );
    [p83,h83, stat83] = ranksum(matrixToTest(8,:), matrixToTest(3,:) );
    [p84,h84, stat84] = ranksum(matrixToTest(8,:), matrixToTest(4,:) );
    [p85,h85, stat85] = ranksum(matrixToTest(8,:), matrixToTest(5,:) );
    [p86,h86, stat86] = ranksum(matrixToTest(8,:), matrixToTest(6,:) );
    [p87,h87, stat87] = ranksum(matrixToTest(8,:), matrixToTest(7,:) );
    [p89,h89, stat89] = ranksum(matrixToTest(8,:), matrixToTest(9,:) );




    pRanksumP = [ p81;p82;p83;p84;p85;p86;p87;p89];
    hRanksumP = [ h81;h82;h83;h84;h85;h86;h87;h89];
    statRanksumP = [stat81.ranksum;stat82.ranksum;stat83.ranksum;stat84.ranksum;stat85.ranksum;stat86.ranksum;stat87.ranksum;stat89.ranksum];



end


end

