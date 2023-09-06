


isolet = load("Isolet.mat");




X = [isolet.Y,isolet.X];


% X = double(X);
 M = 20;
K = 26;
N = 1560;
 p = 0.6; % valore non usato nei dataset reali
 n_it = 50;
ens_feat = [N,M, K,p];



testPartition(ens_feat,M,M,10,n_it,  @relabelAndVote, @syncVoting,"Isolet", X, false);


% testPartition(ens_feat,M,M,10,n_it,  @weightedVoting_simple, @syncVotingSmpl,"Isolet", X, false);
% 
% 
% 
% 
% 
% testPartition(ens_feat,M,M,10,n_it,  @weightedVoting_average, @syncVotingAvg,"Isolet", X, false);
% % 
% testSyncNoise(ens_feat,0.3,1,0.1,n_it,@relabelAndVote, @syncVoting,"Isolet", X);
% testSyncNoise(ens_feat,0.3,1,0.1,n_it,@weightedVoting_simple, @syncVotingSmpl,"Isolet", X);
% testSyncNoise(ens_feat,0.3,1,0.1,n_it, @weightedVoting_average, @syncVotingAvg,"Isolet", X);

