X = open('silhouette.mat').array;

% segmentation(:,1) = [];
 M = 20;
K = 3;
N = 846;
 p = 0.6; % valore non usato nei dataset reali
 n_it = 50;
ens_feat = [N,M, K,p];
testPartition(ens_feat,M,M,10,n_it,  @relabelAndVote, @syncVoting,"Silhouette", X, false);


% testPartition(ens_feat,M,M,10,n_it,  @weightedVoting_simple, @syncVotingSmpl,"Silhouette", X, false);
% 
% 
% testPartition(ens_feat,M,M,10,n_it,  @weightedVoting_average, @syncVotingAvg,"Silhouette", X, false);

% testSyncNoise(ens_feat,0.3,1,0.1,n_it,@relabelAndVote, @syncVoting,"Segmentation", X);
% testSyncNoise(ens_feat,0.3,1,0.1,n_it,@weightedVoting_simple, @syncVotingSmpl,"Segmentation", X);
% testSyncNoise(ens_feat,0.3,1,0.1,n_it, @weightedVoting_average, @syncVotingAvg,"Segmentation", X);

