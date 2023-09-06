function  plotDataset(datasetList)
close all
N = size(datasetList,2);
TIME = zeros(6,N);
NMI = zeros(7,N);
NMI_GT = zeros(7,N);
ARI= zeros(7,N);
ARI_GT= zeros(7,N);
ACC = zeros(7,N);
for i = 1: N

datasetName = datasetList{i};
TIME(:,i) = readmatrix(strcat("../..//Results/",datasetName,"/Partitions/time_partition_relabelAndVote_", datasetName,".txt"));
NMI(:,i) = readmatrix(strcat("../..//Results/",datasetName,"/Partitions/NMI_partition_relabelAndVote_", datasetName,".txt"));
NMI_GT(:,i) = readmatrix(strcat("../..//Results/",datasetName,"/Partitions/NMI_partition_gt_relabelAndVote_", datasetName,".txt"));
ARI(:,i) = readmatrix(strcat("../..//Results/",datasetName,"/Partitions/ARI_partition_relabelAndVote_", datasetName,".txt"));
ARI_GT(:,i) = readmatrix(strcat("../..//Results/",datasetName,"/Partitions/ARI_partition_gt_relabelAndVote_", datasetName,".txt"));
ACC(:,i) = readmatrix(strcat("../..//Results/",datasetName,"/Partitions/acc_partition_relabelAndVote_", datasetName,".txt"));
end
% time_partition_weightedVoting_simple = readmatrix(strcat("../..//Results/",datasetName,"/Partitions/time_partition_weightedVoting_simple_", datasetName,".txt"));
% NMI_partition_weightedVoting_simple = readmatrix(strcat("../..//Results/",datasetName,"/Partitions/NMI_partition_weightedVoting_simple_", datasetName,".txt"));
% NMI_partition_gt_weightedVoting_simple = readmatrix(strcat("../..//Results/",datasetName,"/Partitions/NMI_partition_gt_weightedVoting_simple_", datasetName,".txt"));
% ARI_partition_weightedVoting_simple = readmatrix(strcat("../..//Results/",datasetName,"/Partitions/ARI_partition_weightedVoting_simple_", datasetName,".txt"));
% ARI_partition_gt_weightedVoting_simple = readmatrix(strcat("../..//Results/",datasetName,"/Partitions/ARI_partition_gt_weightedVoting_simple_", datasetName,".txt"));
% acc_partition_weightedVoting_simple = readmatrix(strcat("../..//Results/",datasetName,"/Partitions/acc_partition_weightedVoting_simple_", datasetName,".txt"));
% 
% time_partition_weightedVoting_average = readmatrix(strcat("../..//Results/",datasetName,"/Partitions/time_partition_weightedVoting_average_", datasetName,".txt"));
% NMI_partition_weightedVoting_average = readmatrix(strcat("../..//Results/",datasetName,"/Partitions/NMI_partition_weightedVoting_average_", datasetName,".txt"));
% NMI_partition_gt_weightedVoting_average = readmatrix(strcat("../..//Results/",datasetName,"/Partitions/NMI_partition_gt_weightedVoting_average_", datasetName,".txt"));
% ARI_partition_weightedVoting_average = readmatrix(strcat("../..//Results/",datasetName,"/Partitions/ARI_partition_weightedVoting_average_", datasetName,".txt"));
% ARI_partition_gt_weightedVoting_average = readmatrix(strcat("../..//Results/",datasetName,"/Partitions/ARI_partition_gt_weightedVoting_average_", datasetName,".txt"));
% acc_partition_weightedVoting_average = readmatrix(strcat("../..//Results/",datasetName,"/Partitions/acc_partition_weightedVoting_average_", datasetName,".txt"));
% 
% 
% 
% std_NMI_partition_gt_relabelAndVote =         readmatrix(strcat("../../Results/", datasetName,"/Partitions/STD_NMI_gt_relabelAndVote_", datasetName ));
% std_NMI_partition_relabelAndVote =         readmatrix( strcat("../../Results/", datasetName,"/Partitions/STD_NMI_relabelAndVote_", datasetName ));
% 
% std_ARI_partition_gt_relabelAndVote =        readmatrix(  strcat("../../Results/", datasetName,"/Partitions/STD_ARI_gt_relabelAndVote_", datasetName ));
% std_ARI_partition_relabelAndVote =         readmatrix(  strcat("../../Results/", datasetName,"/Partitions/STD_ARI_relabelAndVote_", datasetName ));
% 
% std_acc_partition_relabelAndVote =        readmatrix(  strcat("../../Results/", datasetName,"/Partitions/STD_acc_relabelAndVote_", datasetName ));
% std_time_partition_relabelAndVote  =   readmatrix(  strcat("../../Results/", datasetName,"/Partitions/STD_time_relabelAndVote_", datasetName ));
% 
% 
% 
% std_NMI_partition_gt_weightedVoting_simple =         readmatrix(strcat("../../Results/", datasetName,"/Partitions/STD_NMI_gt_weightedVoting_simple_", datasetName ));
% std_NMI_partition_weightedVoting_simple =         readmatrix( strcat("../../Results/", datasetName,"/Partitions/STD_NMI_weightedVoting_simple_", datasetName ));
% 
% std_ARI_partition_gt_weightedVoting_simple =        readmatrix(  strcat("../../Results/", datasetName,"/Partitions/STD_ARI_gt_weightedVoting_simple_", datasetName ));
% std_ARI_partition_weightedVoting_simple =         readmatrix(  strcat("../../Results/", datasetName,"/Partitions/STD_ARI_weightedVoting_simple_", datasetName ));
% 
% std_acc_partition_weightedVoting_simple =        readmatrix(  strcat("../../Results/", datasetName,"/Partitions/STD_acc_weightedVoting_simple_", datasetName ));
% std_time_partition_weightedVoting_simple  =   readmatrix(  strcat("../../Results/", datasetName,"/Partitions/STD_time_weightedVoting_simple_", datasetName ));
% 
% 
% 
% std_NMI_partition_gt_weightedVoting_average =         readmatrix(strcat("../../Results/", datasetName,"/Partitions/STD_NMI_gt_weightedVoting_average_", datasetName ));
% std_NMI_partition_weightedVoting_average =         readmatrix( strcat("../../Results/", datasetName,"/Partitions/STD_NMI_weightedVoting_average_", datasetName ));
% 
% std_ARI_partition_gt_weightedVoting_average =        readmatrix(  strcat("../../Results/", datasetName,"/Partitions/STD_ARI_gt_weightedVoting_average_", datasetName ));
% std_ARI_partition_weightedVoting_average =         readmatrix(  strcat("../../Results/", datasetName,"/Partitions/STD_ARI_weightedVoting_average_", datasetName ));
% 
% std_acc_partition_weightedVoting_average =        readmatrix(  strcat("../../Results/", datasetName,"/Partitions/STD_acc_weightedVoting_average_", datasetName ));
% std_time_partition_weightedVoting_average  =   readmatrix(  strcat("../../Results/", datasetName,"/Partitions/STD_time_weightedVoting_average_", datasetName ));
% 
% 
% 
% 
% 
% 
% STD_TIME = [std_time_partition_relabelAndVote,std_time_partition_weightedVoting_simple,std_time_partition_weightedVoting_average];
% STD_NMI = [std_NMI_partition_relabelAndVote,std_NMI_partition_weightedVoting_simple,std_NMI_partition_weightedVoting_average];
% STD_NMI_GT = [std_NMI_partition_gt_relabelAndVote,std_NMI_partition_gt_weightedVoting_simple,std_NMI_partition_gt_weightedVoting_average];
% STD_ARI = [std_ARI_partition_relabelAndVote,std_ARI_partition_weightedVoting_simple,std_ARI_partition_weightedVoting_average];
% STD_ARI_GT = [std_ARI_partition_gt_relabelAndVote,std_ARI_partition_gt_weightedVoting_simple,std_ARI_partition_gt_weightedVoting_average];
% STD_acc = [std_acc_partition_relabelAndVote,std_acc_partition_weightedVoting_simple,std_acc_partition_weightedVoting_average];
% 
% 
% 
% TIME = [time_partition_relabelAndVote,time_partition_weightedVoting_simple,time_partition_weightedVoting_average];
% NMI = [NMI_partition_relabelAndVote,NMI_partition_weightedVoting_simple,NMI_partition_weightedVoting_average];
% NMI_GT = [NMI_partition_gt_relabelAndVote,NMI_partition_gt_weightedVoting_simple,NMI_partition_gt_weightedVoting_average];
% ARI = [ARI_partition_relabelAndVote,ARI_partition_weightedVoting_simple,ARI_partition_weightedVoting_average];
% ARI_GT = [ARI_partition_gt_relabelAndVote,ARI_partition_gt_weightedVoting_simple,ARI_partition_gt_weightedVoting_average];
% acc = [acc_partition_relabelAndVote,acc_partition_weightedVoting_simple,acc_partition_weightedVoting_average];
% 


legend = {'Hungarian', 'Regression', 'Mcla', 'SV-NMF', 'SV-QM', 'Cspa', 'Random Partition', 'SV-EIG'};

cat = categorical(datasetList);
cat = reordercats(cat,datasetList);






matrixBar(TIME,[], legend, cat, "TIME");
matrixBar(ACC,[], legend, cat,"ACC");
matrixBar(NMI,[], legend, cat,"NMI");
matrixBar(NMI_GT,[], legend, cat, "NMI_GT");
matrixBar(ARI,[], legend, cat, "ARI");
matrixBar(ARI_GT, [],legend, cat, "ARI_GT");

% 
% TIME_table = array2table(TIME, "VariableNames",{'Simple Voting', 'Weighted Simple', 'Weighted Average' }, "RowNames", legend);
% ARI_table = array2table(ARI, "VariableNames",{'Simple Voting', 'Weighted Simple', 'Weighted Average' }, "RowNames", legend);
% ARI_GT_table = array2table(ARI_GT, "VariableNames",{'Simple Voting', 'Weighted Simple', 'Weighted Average' }, "RowNames", legend);
% NMI_table = array2table(NMI, "VariableNames",{'Simple Voting', 'Weighted Simple', 'Weighted Average' }, "RowNames", legend);
% NMI_GT_table = array2table(NMI_GT, "VariableNames",{'Simple Voting', 'Weighted Simple', 'Weighted Average' }, "RowNames", legend);
% acc_table = array2table(acc, "VariableNames",{'Simple Voting', 'Weighted Simple', 'Weighted Average' }, "RowNames", legend);
% 
% 
% 
% writetable(TIME_table,strcat("../..//Results/",datasetName,"/Tables/TIME_", datasetName),'WriteRowNames',true)
% writetable(ARI_table,strcat("../..//Results/",datasetName,"/Tables/ARI_", datasetName),'WriteRowNames',true)
% writetable(ARI_GT_table,strcat("../..//Results/",datasetName,"/Tables/ARI_GT_", datasetName),'WriteRowNames',true)
% writetable(NMI_table,strcat("../..//Results/",datasetName,"/Tables/NMI_", datasetName),'WriteRowNames',true)
% writetable(NMI_GT_table,strcat("../..//Results/",datasetName,"/Tables/NMI_GT_", datasetName),'WriteRowNames',true)
% writetable(acc_table,strcat("../..//Results/",datasetName,"/Tables/acc_", datasetName),'WriteRowNames',true)
% 
% 
% 
% 
% % x_m = [10:+10:80];
% % matrixToPrint ={time_partition_relabelAndVote};
% % titles = ["Average time  with different number of partitions"];
% % y = ["time (Seconds)"];
% % plotMatrixList(x_m,matrixToPrint, titles, legend,"# of partitions", y, true);
% % 
% % matrixToPrint ={NMI_partition_gt_relabelAndVote};
% % titles = ["Average NMI wrt the GT with different number of partitions [SIMPLE VOTING]"];
% % y = ["NMI"];
% % plotMatrixList(x_m,matrixToPrint, titles, legend,"# of partitions", y);
% % 
% % matrixToPrint ={NMI_partition_relabelAndVote};
% % titles = ["Average NMI  with different number of partitions [SIMPLE VOTING]"];
% % y = ["NMI"];
% % plotMatrixList(x_m,matrixToPrint, titles, legend,"# of partitions", y);
% % 
% % 
% % matrixToPrint ={ARI_partition_gt_relabelAndVote};
% % titles = ["Average ARI wrt the GT with different number of partitions [SIMPLE VOTING]"];
% % y = ["ARI"];
% % plotMatrixList(x_m,matrixToPrint, titles, legend,"# of partitions", y);
% % 
% % matrixToPrint ={ARI_partition_relabelAndVote};
% % titles = ["Average ARI  with different number of partitions [SIMPLE VOTING]"];
% % y = ["ARI"];
% % plotMatrixList(x_m,matrixToPrint, titles, legend,"# of partitions", y);
% % 
% % matrixToPrint ={acc_partition_relabelAndVote};
% % titles = ["Average classification accuracy with different number of partitions"];
% % y = ["ACC"];
% % plotMatrixList(x_m,matrixToPrint, titles, legend,"# of partitions", y, true);

end

