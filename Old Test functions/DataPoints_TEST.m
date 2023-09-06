% VALORI REALISTICI
%
% K = 2..10
% M = 2...10/10...100
% X = 100...1000

clear
clc
close all
addpath("Partition functions\")
addpath("Partition functions/")
addpath("Testing Functions\")
addpath("Testing Functions/")
addpath("Testing Functions/Metrics")
addpath("Partition generation")
addpath("ClusterPack-V2.0\")
addpath("ClusterPack-V2.0/")
addpath("Relabeling Functions\")
addpath("Relabeling Functions/")
addpath("Relabeling Functions\Linear Assignment Functions\")
addpath("Relabeling Functions/Linear Assignment Functions/")
addpath("Misc")
addpath("Voting Functions\")
addpath("Voting Functions/")


NMI_noise = [];
ARI_noise = [];
NMI_noise_gt = [];
ARI_noise_gt = [];
p = 0.9;
M = 5;
K = 3;

DEBUG = true;
step = 100;
n_it = 50;
if DEBUG
    x_N = [];
    for N = 100:+step:1000
        x_N = [x_N, N];
        disp(["iterazione numero ", M/step] )
        NMI_iteration = [];
        ARI_iteration = [];

         NMI_iteration_gt = [];
        ARI_iteration_gt = [];

        for i = 1:n_it
            [X,pi_gt] = generateGroundTruth(K,N,4);

            PI = generatePartitions(M, pi_gt, p);
            relVotingHung = relabelAndVote("Hungarian", PI{1},PI(2:M));
            relVotingRegr = relabelAndVote("Regression", PI{1},PI(2:M));
            relVotingMatch = relabelAndVote("Matchpairs", PI{1},PI(2:M));
            relVotingJV = relabelAndVote("Jonker-Volgenant", PI{1},PI(2:M));

            pi_star_votingHung = majorityVoting(relVotingHung);
            pi_star_votingRegr = majorityVoting(relVotingRegr);
            pi_star_votingMatch = majorityVoting(relVotingMatch);
            pi_star_votingJV = majorityVoting(relVotingJV);

            cd ClusterPack-V2.0\;
            %cd ClusterPack-V2.0/;

            relVotingMCLA = mcla(EnsembleLabelMAtrix(PI))';
%             pi_star_mcla = fromLVtoBA(mclaLV);
            pi_star_mcla = majorityVoting(relVotingMCLA);
            cd ..

            [NMI_votingHung, ARI_votingHung] = average_metric(PI,pi_star_votingHung);
            [NMI_votingRegr, ARI_votingRegr] = average_metric(PI,pi_star_votingRegr);
            [NMI_votingMatch, ARI_votingMatch] = average_metric(PI,pi_star_votingMatch);
            [NMI_votingJV, ARI_votingJV] = average_metric(PI,pi_star_votingJV);
            [NMI_mcla, ARI_mcla] = average_metric(PI,pi_star_mcla);


             NMI_votingHung_gt  = nmi(fromBAtoLV(pi_gt),fromBAtoLV( pi_star_votingHung));
            ARI_votingHung_gt = useARI(pi_gt,pi_star_votingHung);
            NMI_votingRegr_gt = nmi(fromBAtoLV(pi_gt), fromBAtoLV(pi_star_votingRegr));
            ARI_votingRegr_gt = useARI(pi_gt,pi_star_votingRegr);
            NMI_votingMatch_gt= nmi(fromBAtoLV(pi_gt), fromBAtoLV(pi_star_votingMatch));
            ARI_votingMatch_gt = useARI(pi_gt,pi_star_votingMatch);
            NMI_votingJV_gt= nmi(fromBAtoLV(pi_gt), fromBAtoLV(pi_star_votingJV));
            ARI_votingJV_gt = useARI(pi_gt,pi_star_votingJV);
            NMI_mcla_gt= nmi(fromBAtoLV(pi_gt), fromBAtoLV(pi_star_mcla));
            ARI_mcla_gt = useARI(pi_gt,pi_star_mcla);



            NMI_iteration = [NMI_iteration, [NMI_votingHung;NMI_votingRegr;NMI_votingMatch;NMI_votingJV;NMI_mcla]];
            ARI_iteration = [ARI_iteration, [ARI_votingHung;ARI_votingRegr;ARI_votingMatch;ARI_votingJV;ARI_mcla]];
        
             NMI_iteration_gt = [NMI_iteration_gt, [NMI_votingHung_gt;NMI_votingRegr_gt;NMI_votingMatch_gt;NMI_votingJV_gt;NMI_mcla_gt]];
            ARI_iteration_gt = [ARI_iteration_gt, [ARI_votingHung_gt;ARI_votingRegr_gt;ARI_votingMatch_gt;ARI_votingJV_gt;ARI_mcla_gt]];
            
           

        end
        NMI_noise = [NMI_noise, sum(NMI_iteration, 2)/n_it];
        ARI_noise = [ARI_noise, sum(ARI_iteration, 2)/n_it];

        NMI_noise_gt = [NMI_noise_gt, sum(NMI_iteration_gt, 2)/n_it];
        ARI_noise_gt = [ARI_noise_gt, sum(ARI_iteration_gt, 2)/n_it];

    end
    writematrix(NMI_noise);
    writematrix(ARI_noise);

      writematrix(NMI_noise_gt);
    writematrix(ARI_noise_gt);
else
    NMI_noise = readmatrix("NMI_noise.txt");
    ARI_noise = readmatrix("ARI_noise.txt");

     NMI_noise_gt = readmatrix("NMI_noise_gt.txt");
    ARI_noise_gt = readmatrix("ARI_noise_gt.txt");
end
figure
plot( x_N,NMI_noise(1,:), x_N, NMI_noise(2,:),x_N, NMI_noise(3,:),x_N, NMI_noise(4,:), x_N, NMI_noise(5,:));
hold on
l = legend("Hungarian", "Regression", "Matchpairs","Jonker-Volgenant",    "Mcla");
l.Location = "northwest";

title("Average NMI with different # of data points")
xlabel("# of Data Points")
ylabel("NMI")
hold off

figure

plot( x_N,ARI_noise(1,:), x_N, ARI_noise(2,:),x_N,ARI_noise(3,:),x_N, ARI_noise(4,:), x_N, ARI_noise(5,:));
hold on
l = legend("Hungarian", "Regression", "Matchpairs","Jonker-Volgenant",    "Mcla");
l.Location = "northwest";

title("Average ARI with different # of data points")
xlabel("# of Data Points")
ylabel("ARI")
hold off


figure
plot( x_N,NMI_noise_gt(1,:), x_N, NMI_noise_gt(2,:),x_N, NMI_noise_gt(3,:),x_N, NMI_noise_gt(4,:), x_N, NMI_noise_gt(5,:));
hold on
l = legend("Hungarian", "Regression", "Matchpairs","Jonker-Volgenant",    "Mcla");
l.Location = "northwest";

title("Average NMI wrt the GT with different # of data points")
xlabel("# of Data Points")
ylabel("NMI")
hold off

figure

plot( x_N,ARI_noise_gt(1,:), x_N, ARI_noise_gt(2,:),x_N,ARI_noise_gt(3,:),x_N, ARI_noise_gt(4,:), x_N, ARI_noise_gt(5,:));
hold on
l = legend("Hungarian", "Regression", "Matchpairs","Jonker-Volgenant",    "Mcla");
l.Location = "northwest";

title("Average ARI wrt the GT with different # of data points")
xlabel("# of Data Points")
ylabel("ARI")
hold off



