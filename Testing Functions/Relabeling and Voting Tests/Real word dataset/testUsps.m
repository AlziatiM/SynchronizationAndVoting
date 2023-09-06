usps = load("usps_all.mat").data;

X = [];
for i = 1:10
Xclass = usps(:,:,i);
Xclass_correct = Xclass';
Xclass_correct = [i*ones(1100,1), Xclass_correct];
X = [X;Xclass_correct];
end

X = double(X);
 M = 20;
K = 10;
N = 11000;
 p = 0.6; % valore non usato nei dataset reali
 n_it = 32;
ens_feat = [N,M, K,p];
 

testPartition(ens_feat,M,M,10,n_it,  @relabelAndVote, @syncVoting,"Usps", X, false);


% testPartition(ens_feat,M,M,10,n_it,  @weightedVoting_simple, @syncVotingSmpl,"Usps", X, false);
% 
% 
% testPartition(ens_feat,M,M,10,n_it,  @weightedVoting_average, @syncVotingAvg,"Usps", X, false);

% 
% % testSyncNoise(ens_feat,0.3,1,0.1,n_it,@relabelAndVote, @syncVoting,"Usps", X);
% testSyncNoise(ens_feat,0.3,1,0.1,n_it,@weightedVoting_simple, @syncVotingSmpl,"Usps", X);
% testSyncNoise(ens_feat,0.3,1,0.1,n_it, @weightedVoting_average, @syncVotingAvg,"Usps", X);
