iris = load("iris.data");

X = iris(:,[5 1 2 3 4]);


X = double(X);
 M = 50;
K = 3;
N = 150;
 p = 0.6; % valore non usato nei dataset reali
 n_it = 50;
ens_feat = [N,M, K,p];
 

testPartition(ens_feat,M,M,10,n_it,  @relabelAndVote, @syncVoting,"Iris", X, false);

% 
% testPartition(ens_feat,M,M,10,n_it,  @weightedVoting_simple, @syncVotingSmpl,"Iris", X,false);
% 
% 
% testPartition(ens_feat,M,M,10,n_it,  @weightedVoting_average, @syncVotingAvg,"Iris", X, false);
% % 
% testSyncNoise(ens_feat,0.3,1,0.1,n_it,@relabelAndVote, @syncVoting,"Iris", X);
% testSyncNoise(ens_feat,0.3,1,0.1,n_it,@weightedVoting_simple, @syncVotingSmpl,"Iris", X);
% testSyncNoise(ens_feat,0.3,1,0.1,n_it, @weightedVoting_average, @syncVotingAvg,"Iris", X);


