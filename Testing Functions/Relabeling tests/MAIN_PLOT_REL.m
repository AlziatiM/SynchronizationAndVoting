close all

MISCL_Noise_M_10 = readmatrix("../../IMAGES/Relabeling/Noise/MISCL_Noise_M10.txt");
MISCL_Noise_M_20 = readmatrix("../../IMAGES/Relabeling/Noise/MISCL_Noise_M20.txt");
MISCL_Noise_M_30 = readmatrix("../../IMAGES/Relabeling/Noise/MISCL_Noise_M30.txt");
MISCL_Noise_M_40 = readmatrix("../../IMAGES/Relabeling/Noise/MISCL_Noise_M40.txt");
MISCL_Noise_M_50 = readmatrix("../../IMAGES/Relabeling/Noise/MISCL_Noise_M50.txt");
MISCL_Noise_M_60 = readmatrix("../../IMAGES/Relabeling/Noise/MISCL_Noise_M60.txt");
MISCL_Noise_M_70 = readmatrix("../../IMAGES/Relabeling/Noise/MISCL_Noise_M70.txt");
MISCL_Noise_M_80 = readmatrix("../../IMAGES/Relabeling/Noise/MISCL_Noise_M80.txt");
MISCL_Noise_M_90 = readmatrix("../../IMAGES/Relabeling/Noise/MISCL_Noise_M90.txt");
MISCL_Noise_M_100 = readmatrix("../../IMAGES/Relabeling/Noise/MISCL_Noise_M100.txt");


MISCL_Partition = readmatrix("../../IMAGES/Relabeling/Partition/MISCL_Partition.txt");
MISCL_Cluster = readmatrix("../../IMAGES/Relabeling/Cluster/MISCL_Cluster.txt");
MISCL_Points = readmatrix("../../IMAGES/Relabeling/Points/MISCL_Points.txt");

legend = ["Hungarian", "Regression", "Matchpairs","Jonker-Volgenant", "Sync", "Mcla"];


% % % % % % % % noise with partition iteration% % % % % % % % % % % % % % % % % % % % % % % % % % % 

x_p = [0.3:0.1:1];
matrixToPrint ={MISCL_Noise_M_10};
titles = [ "Misclassification Error wrt the GT with noise variation (M = 10)"];
y = ["Correctly classified points"];
plotMatrixList(x_p,matrixToPrint, titles, legend,"% of correctly labelled points", y);


matrixToPrint ={MISCL_Noise_M_20};
titles = [ "Misclassification Error wrt the GT with noise variation (M = 20)"];
y = ["Correctly classified points"];
plotMatrixList(x_p,matrixToPrint, titles, legend,"% of correctly labelled points", y);


matrixToPrint ={MISCL_Noise_M_30};
titles = [ "Misclassification Error wrt the GT with noise variation (M = 30)"];
y = ["Correctly classified points"];
plotMatrixList(x_p,matrixToPrint, titles, legend,"% of correctly labelled points", y);


matrixToPrint ={MISCL_Noise_M_40};
titles = [ "Misclassification Error wrt the GT with noise variation (M = 40)"];
y = ["Correctly classified points"];
plotMatrixList(x_p,matrixToPrint, titles, legend,"% of correctly labelled points", y);


matrixToPrint ={MISCL_Noise_M_50};
titles = [ "Misclassification Error wrt the GT with noise variation (M = 50)"];
y = ["Correctly classified points"];
plotMatrixList(x_p,matrixToPrint, titles, legend,"% of correctly labelled points", y);


matrixToPrint ={MISCL_Noise_M_60};
titles = [ "Misclassification Error wrt the GT with noise variation (M = 60)"];
y = ["Correctly classified points"];
plotMatrixList(x_p,matrixToPrint, titles, legend,"% of correctly labelled points", y);


matrixToPrint ={MISCL_Noise_M_70};
titles = [ "Misclassification Error wrt the GT with noise variation (M = 70)"];
y = ["Correctly classified points"];
plotMatrixList(x_p,matrixToPrint, titles, legend,"% of correctly labelled points", y);


matrixToPrint ={MISCL_Noise_M_80};
titles = [ "Misclassification Error wrt the GT with noise variation (M = 80)"];
y = ["Correctly classified points"];
plotMatrixList(x_p,matrixToPrint, titles, legend,"% of correctly labelled points", y);


matrixToPrint ={MISCL_Noise_M_90};
titles = [ "Misclassification Error wrt the GT with noise variation (M = 90)"];
y = ["Correctly classified points"];
plotMatrixList(x_p,matrixToPrint, titles, legend,"% of correctly labelled points", y);


matrixToPrint ={MISCL_Noise_M_100};
titles = [ "Misclassification Error wrt the GT with noise variation (M = 100)"];
y = ["Correctly classified points"];
plotMatrixList(x_p,matrixToPrint, titles, legend,"% of correctly labelled points", y);


% % % % % % % partitions% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
x_m = [10:10:100];
matrixToPrint ={MISCL_Partition};
titles = [ "Misclassification Error wrt the GT with with different number of partitions"];
y = ["Correctly classified points"];
plotMatrixList(x_m,matrixToPrint, titles, legend,"# of partitions", y);
% % % % % % % %Cluster % % % % % % % % % % % % % % % 

x_K = [2:1:10];

matrixToPrint ={MISCL_Cluster};
titles = [ "Misclassification Error wrt the GT with # of Clusters"];
y = ["Correctly classified points"];
plotMatrixList(x_K,matrixToPrint, titles, legend,"# of Clusters", y);


% % % % % % % % % Points% % % % % % % % % % % % % % % % % % % % % % % 
% x_N = [100:100:1000];
% 
% matrixToPrint ={MISCL_Points};
% titles = [ "Misclassification Error wrt the GT with # of data points"];
% y = ["Correctly classified points"];
% plotMatrixList(x_N,matrixToPrint, titles, legend,"# of data points", y);
