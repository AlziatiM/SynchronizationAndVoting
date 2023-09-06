


lung = load("lung.mat");




X = [lung.Y,lung.X];


% X = double(X);
 M = 20;
K = 5;
N = 203;
 p = 0.6; % valore non usato nei dataset reali
 n_it = 50;
ens_feat = [N,M, K,p];



testPartition(ens_feat,M,M,10,n_it,  @relabelAndVote, @syncVoting,"Lung", X, false);


% testPartition(ens_feat,M,M,10,n_it,  @weightedVoting_simple, @syncVotingSmpl,"Lung", X, false);
% 
% 
% 
% 
% 
% testPartition(ens_feat,M,M,10,n_it,  @weightedVoting_average, @syncVotingAvg,"Lung", X, false);
% % 
% testSyncNoise(ens_feat,0.3,1,0.1,n_it,@relabelAndVote, @syncVoting,"Isolet", X);
% testSyncNoise(ens_feat,0.3,1,0.1,n_it,@weightedVoting_simple, @syncVotingSmpl,"Isolet", X);
% testSyncNoise(ens_feat,0.3,1,0.1,n_it, @weightedVoting_average, @syncVotingAvg,"Isolet", X);

