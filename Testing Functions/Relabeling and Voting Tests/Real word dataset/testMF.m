mf_zer = load("mfeat/mfeat-zer");
mf_fou = load("mfeat/mfeat-fou");
mf_fac = load("mfeat/mfeat-fac");
mf_kar = load("mfeat/mfeat-kar");
mf_pix = load("mfeat/mfeat-pix");
mf_mor = load("mfeat/mfeat-mor");



X = [mf_mor,mf_pix,mf_kar,mf_fac,mf_fou,mf_zer];
gt =[];
for i = 1:10
 gt =  [gt;i*ones(200,1) ];
end
X = [gt, X];

X = double(X);
 M = 20;
K = 10;
N = 2000;
 p = 0.6; % valore non usato nei dataset reali
 n_it = 50;
ens_feat = [N,M, K,p];
 

testPartition(ens_feat,M,M,10,n_it,  @relabelAndVote, @syncVoting,"MF", X, false);


% testPartition(ens_feat,M,M,10,n_it,  @weightedVoting_simple, @syncVotingSmpl,"MF", X, false);
% 
% 
% testPartition(ens_feat,M,M,10,n_it,  @weightedVoting_average, @syncVotingAvg,"MF", X, false);

% testSyncNoise(ens_feat,0.3,1,0.1,n_it,@relabelAndVote, @syncVoting,"MF", X);
% testSyncNoise(ens_feat,0.3,1,0.1,n_it,@weightedVoting_simple, @syncVotingSmpl,"MF", X);
% testSyncNoise(ens_feat,0.3,1,0.1,n_it, @weightedVoting_average, @syncVotingAvg,"MF", X);

