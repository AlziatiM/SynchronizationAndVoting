X = load("segmentationFull.data");

% segmentation(:,1) = [];
 M = 20;
K = 7;
N = 2100;
 p = 0.6; % valore non usato nei dataset reali
 n_it = 50;
ens_feat = [N,M, K,p];
testPartition(ens_feat,M,M,10,n_it,  @relabelAndVote, @syncVoting,"Segmentation", X, false);


% testPartition(ens_feat,M,M,10,n_it,  @weightedVoting_simple, @syncVotingSmpl,"Segmentation", X, false);
% 
% 
% testPartition(ens_feat,M,M,10,n_it,  @weightedVoting_average, @syncVotingAvg,"Segmentation", X, false);

% testSyncNoise(ens_feat,0.3,1,0.1,n_it,@relabelAndVote, @syncVoting,"Segmentation", X);
% testSyncNoise(ens_feat,0.3,1,0.1,n_it,@weightedVoting_simple, @syncVotingSmpl,"Segmentation", X);
% testSyncNoise(ens_feat,0.3,1,0.1,n_it, @weightedVoting_average, @syncVotingAvg,"Segmentation", X);

