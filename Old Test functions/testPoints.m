function [x_N,NMI_points,ARI_points,NMI_points_gt,ARI_points_gt] = testPoints(params,min, max, step, n_it, votingFun,syncVotingFun,DEBUG)
if(nargin <8)
    DEBUG = true;
end

N = params(1);
M = params(2);
K = params(3);
p = params(4);
% VALORI REALISTICI
%
% K = 2..10
% M = 2...10/10...100
% X = 100...1000

% clear
% clc
% close all
% addpath("Partition functions\")
% addpath("Partition functions/")
% addpath("Testing Functions\")
% addpath("Testing Functions/")
% addpath("Testing Functions/Metrics")
% addpath("Partition generation")
% addpath("ClusterPack-V2.0\")
% addpath("ClusterPack-V2.0/")
% addpath("Relabeling Functions\")
% addpath("Relabeling Functions/")
% addpath("Relabeling Functions\Linear Assignment Functions\")
% addpath("Relabeling Functions/Linear Assignment Functions/")
% addpath("Misc")
% addpath("Voting Functions\")
% addpath("Voting Functions/")


NMI_points = [];
ARI_points = [];
NMI_points_gt = [];
ARI_points_gt = [];
% K = 3;
% N = 100;
% p = 0.9;
% DEBUG = true;
% step = 1;
% n_it = 50;
 x_N = [min:step:max];
if DEBUG
    for N =     min:+step:max
        
        
        [NMI_iteration_gt,ARI_iteration_gt,NMI_iteration, ARI_iteration] =execTestIteration([N, M,K,p],n_it, votingFun,syncVotingFun);
        
        NMI_points = [NMI_points, sum(NMI_iteration, 2)/n_it];
        ARI_points = [ARI_points, sum(ARI_iteration, 2)/n_it];

        NMI_points_gt = [NMI_points_gt, sum(NMI_iteration_gt, 2)/n_it];
        ARI_points_gt = [ARI_points_gt, sum(ARI_iteration_gt, 2)/n_it];

    end
    writematrix(NMI_points);
    writematrix(ARI_points);

    writematrix(NMI_points_gt);
    writematrix(ARI_points_gt);
else
    NMI_points = readmatrix("NMI_points.txt");
    ARI_points = readmatrix("ARI_points.txt");

    NMI_points_gt = readmatrix("NMI_points_gt.txt");
    ARI_points_gt = readmatrix("ARI_points_gt.txt");
end
legend = ["Hungarian", "Regression", "Matchpairs","Jonker-Volgenant", "Mcla"];
% plotMetrics(x_N,NMI_points,ARI_points,NMI_points_gt,ARI_points_gt, "wrt the GT with different # of points", legend, "# of points");






