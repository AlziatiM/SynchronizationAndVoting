mnist = load("mnist_all.mat");

X = [];
fn = fieldnames(mnist);
for i = 1:+2:numel(fn)
Xclass = mnist.(fn{i})(1:500,:);
Xclass_correct = [ceil(i/2)*ones(size(Xclass,1),1), Xclass];
X = [X;Xclass_correct];
end


X = double(X);

 M = 20;
K = 10;
N = 5000;
 p = 0.6; % valore non usato nei dataset reali
 n_it = 50;
ens_feat = [N,M, K,p];
 

testPartition(ens_feat,M,M,10,n_it,  @relabelAndVote, @syncVoting,"Mnist", X, false);


% testPartition(ens_feat,M,M,10,n_it,  @weightedVoting_simple, @syncVotingSmpl,"Mnist", X, false);
% 
% 
% testPartition(ens_feat,M,M,10,n_it,  @weightedVoting_average, @syncVotingAvg,"Mnist", X, false);

% testSyncNoise(ens_feat,0.3,1,0.1,n_it,@relabelAndVote, @syncVoting,"Mnist", X);
% testSyncNoise(ens_feat,0.3,1,0.1,n_it,@weightedVoting_simple, @syncVotingSmpl,"Mnist", X);
% testSyncNoise(ens_feat,0.3,1,0.1,n_it, @weightedVoting_average, @syncVotingAvg,"Mnist", X);
