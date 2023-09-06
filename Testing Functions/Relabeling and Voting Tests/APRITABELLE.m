    function  APRITABELLE(datasetName)
TIME = readtable(strcat("../..//Results/",datasetName,"/Tables/TIME_", datasetName,".txt"));
NMI = readtable(strcat("../..//Results/",datasetName,"/Tables/NMI_", datasetName,".txt"));
NMI_GT = readtable(strcat("../..//Results/",datasetName,"/Tables/NMI_GT_", datasetName,".txt"));
ARI = readtable(strcat("../..//Results/",datasetName,"/Tables/ARI_", datasetName,".txt"));
ARI_GT = readtable(strcat("../..//Results/",datasetName,"/Tables/ARI_GT_", datasetName,".txt"));
MISCL = readtable(strcat("../..//Results/",datasetName,"/Tables/MISCL_", datasetName,".txt"));



end

