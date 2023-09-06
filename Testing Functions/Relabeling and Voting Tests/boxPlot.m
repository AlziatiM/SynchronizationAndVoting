function boxPlot()
close all

votingtype = {'relabelAndVote', 'weightedVoting_simple', 'weightedVoting_average'};


 datasets ={'Iris', 'Lung', 'Wine', 'Silhouette'};
% datasets ={'MF', 'Mnist', 'Usps', 'Isolet' };

% datasets ={'Iris', 'MF'};
TIME = cell(3,1);
ACC =  cell(3,1);
NMI_GT = cell(3,1);;
NMI =  cell(3,1);;
NMI_CESHL =  cell(3,1);;

ARI_GT =  cell(3,1);
ARI =  cell(3,1);
ARI_CESHL =  cell(3,1);
NMI_REL =  cell(3,1);

% folder = "RISULTATI DEF/Results 50 ITERAZIONI  1.0";
 folder = "RISULTATI DEF/Results CON PACHAURI 0.5 K fisso";
 folderCESHL = 'results';
for j = 1:3

    for i = 1: size(datasets, 2)
        TIME{j} = [TIME{j}, readmatrix(strcat("../../",folder,"/",datasets{i},"/Partitions/time_partition_",votingtype{j}, "_", datasets{i},".txt"))];
    end

    for i = 1: size(datasets, 2)
        ACC{j} = [ACC{j}, readmatrix(strcat("../../",folder,"/",datasets{i},"/Partitions/acc_partition_",votingtype{j}, "_", datasets{i},".txt"))];
    end


    for i = 1: size(datasets, 2)
        NMI_GT {j}= [NMI_GT{j}, readmatrix(strcat("../../",folder,"/",datasets{i},"/Partitions/NMI_partition_gt_",votingtype{j}, "_", datasets{i},".txt"))];
    end


    for i = 1: size(datasets, 2)
        NMI{j} = [NMI{j}, readmatrix(strcat("../../",folder,"/",datasets{i},"/Partitions/NMI_partition_",votingtype{j}, "_", datasets{i},".txt"))];
    end


    for i = 1: size(datasets, 2)
        ARI_GT{j} = [ARI_GT{j}, readmatrix(strcat("../../",folder,"/",datasets{i},"/Partitions/ARI_partition_gt_",votingtype{j}, "_", datasets{i},".txt"))];
    end


    for i = 1: size(datasets, 2)
        ARI{j} = [ARI{j}, readmatrix(strcat("../../",folder,"/",datasets{i},"/Partitions/ARI_partition_",votingtype{j}, "_", datasets{i},".txt"))];
    end


    for i = 1: size(datasets, 2)
        NMI_REL{j}= [NMI_REL{j}, readmatrix(strcat("../../",folder,"/",datasets{i},"/Partitions/NMI_partition_rel_",votingtype{j}, "_", datasets{i},".txt"))];
    end
    for i = 1: size(datasets, 2)

        NMI_CESHL{j} =[NMI_CESHL{j}, readmatrix(strcat("../../",folderCESHL,"/",datasets{i},"/Partitions/NMI_partition_","relabelAndVote", "_", datasets{i},".txt"))];
        ARI_CESHL{j} =[ARI_CESHL{j}, readmatrix(strcat("../../",folderCESHL,"/",datasets{i},"/Partitions/ARI_partition_","relabelAndVote", "_", datasets{i},".txt"))];
    end
end

legendLabel = datasets;
cat = categorical({'Hungarian', 'Regression', 'MCLA', 'CESHL', 'SV-NMF', 'SV-QM',  'CSPA','Random', 'SV-EIG'}, 'Ordinal',false);
% cat = reordercats(cat,{'Hungarian', 'Regression', 'Matchpairs','Jonker-Volgenant', 'Mcla', 'Sync', 'Hgpa', 'Cspa'});



% title = strcat('ANMI [Simple Voting]')
% s = matrixBox(NMI{1}',{},cat , title);
% 
% [l, roba] = legend(s,legendLabel,'Orientation','horizontal', 'FontSize', 20);
%  l.Layout = 'northoutside';
% objhl = findobj(roba,'type', 'patch');
% set(objhl, 'Markersize', 15)
for i = 1: 3

NMI{i} = [NMI{i}(1:3,:); NMI_CESHL{i}; NMI{i}(3+1:end,:)];
ARI{i} = [ARI{i}(1:3,:); ARI_CESHL{i}; ARI{i}(3+1:end,:)];
end
figure
tiledlayout(1,2)
titleVoting = { 'Simple Voting', 'Weighted Simple', 'Weighted Average'};

  title = strcat('ANMI [', titleVoting{1}, ']');
     nexttile
% figure
   s = matrixBox(NMI{1}',{},cat , title, 'ANMI');
title = strcat('AARI [', titleVoting{1}, ']');
     nexttile

   s = matrixBox(ARI{1}',{},cat , title,'AARI');

[l, roba] = legend(s,legendLabel,'Orientation','horizontal', 'FontSize', 20);
 l.Layout.Tile = 'north';
objhl = findobj(roba,'type', 'patch');
set(objhl, 'Markersize', 15)

% for z = 1:3
%     title = strcat('TIME [', titleVoting{z}, ']');
%     nexttile
%    s = matrixBox(TIME{z}',{},cat , title);
% end
% l = legend(s,legendLabel,'Orientation','horizontal', 'FontSize', 12);
%  l.Layout.Tile = 'north';


% figure
% % tiledlayout(1,3);
% for z = 1:1
%     title = strcat('ANMI [', titleVoting{z}, ']');
% %     nexttile
%    s = matrixBox(NMI{z}',{},cat , title);
% end
% l = legend(s,legendLabel,'Orientation','horizontal', 'FontSize', 12);
% %  l.Layout.Tile = 'north';
% l.Location = 'Northoutside';
%  figure
% tiledlayout(1,3);
% for z = 1:3
%     title = strcat('NMI_{GT} [', titleVoting{z}, ']');
%     nexttile
%    s = matrixBox(NMI_GT{z}',{},cat , title);
% end
% l = legend(s,legendLabel,'Orientation','horizontal', 'FontSize', 12);
%  l.Layout.Tile = 'north';
% 
%  figure
% tiledlayout(1,3);
% for z = 1:3
%     title = strcat('AARI [', titleVoting{z}, ']');
%     nexttile
%    s = matrixBox(ARI{z}',{},cat , title);
% end
% l = legend(s,legendLabel,'Orientation','horizontal', 'FontSize', 12);
%  l.Layout.Tile = 'north';
% 
%  figure
% tiledlayout(1,3);
% for z = 1:3
%     title = strcat('ARI_{GT} [', titleVoting{z}, ']');
%     nexttile
%    s = matrixBox(ARI_GT{z}',{},cat , title);
% end
% l = legend(s,legendLabel,'Orientation','horizontal', 'FontSize', 12);
%  l.Layout.Tile = 'north';
% 
% 
%  figure
% tiledlayout(1,3);
% for z = 1:3
%     title = strcat('ACC [', titleVoting{z}, ']');
%     nexttile
%    s = matrixBox(ACC{z}',{},cat , title);
% end
% l = legend(s,legendLabel,'Orientation','horizontal', 'FontSize', 12);
%  l.Layout.Tile = 'north';
% 
% 
% 
% 
% % 
% % 
% %     NMI_avg = mean(NMI,2);
% %     NMI_GT_avg = mean(NMI_GT,2);
% 
% %     methods = {'Hungarian', 'Regression', 'Mcla', 'NMF', 'QuickShift',  'Cspa','Random Partition'};
% % 
% %     plotNMIratio(NMI_avg,NMI_GT_avg, methods);
% %     matrixBox(TIME',legendLabel,cat , "TIME");
% %     matrixBox(NMI',legendLabel,cat , "ANMI");
% %     matrixBox(NMI_GT',legendLabel,cat , "NMI_{GT}");
% %     matrixBox(ARI',legendLabel,cat , "AARI");
% %     matrixBox(ARI_GT',legendLabel,cat , "ARI_{GT}");
% %     matrixBox(ACC',legendLabel,cat , "ACC");
% 
% %     cat2 = categorical({'Hungarian', 'Regression',   'NMF', 'QuickShift'}, 'Ordinal',false);
% 
%     % matrixBox(NMI_REL',legendLabel,cat2 , "NMI_{REL}");
% 


end

