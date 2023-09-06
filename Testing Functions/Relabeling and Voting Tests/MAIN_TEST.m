% importer();
n_it = 20;
close all
% ens_feat = [1500, 20, 25,1, 1 ];
ens_feat = [500, 20, 4,0.6, 0.5 ];

% 
% testNoise(ens_feat,0.3,1,0.1,n_it,  @relabelAndVote, @syncVoting);
% f = msgbox("NOISE-simple COMPLETED");
% testNoise(ens_feat,0.3,1,0.1,n_it, @weightedVoting_simple, @syncVotingSmpl);
% f = msgbox("NOISE-WEIGHT simple COMPLETED");
% testNoise(ens_feat,0.3,1,0.1,n_it,  @weightedVoting_average, @syncVotingAvg);
% f = msgbox("NOISE-WEIGHT AVG COMPLETED");

testPartition(ens_feat,10,100,10,n_it,  @relabelAndVote, @syncVoting,"GaussianSynth",[],  true);
f = msgbox("PARTITION-SIMPLE COMPLETED");
% testPartition(ens_feat,10,100,10,n_it, @weightedVoting_simple, @syncVotingSmpl,"GaussianSynth",[],  true);
% f = msgbox("PARTITION-WEIGHT SMPL COMPLETED");
% 
% testPartition(ens_feat,10,100,10,n_it, @weightedVoting_average, @syncVotingAvg,"GaussianSynth",[],  true);
% f = msgbox("PARTITION-WEIGHT AVG COMPLETED");
%  
% testSyncNoise(ens_feat,0.1,1,0.1,n_it, @relabelAndVote, @syncVoting,"GaussianSynth",[],  true);
% f = msgbox("sync- simple COMPLETED");

% testSyncNoise(ens_feat,0.1,1,0.1,n_it, @weightedVoting_simple, @syncVotingSmpl,"GaussianSynth",[],  false);
% f = msgbox("sync-WEIGHT simple COMPLETED");
% 
% testSyncNoise(ens_feat,0.1,1,0.1,n_it, @weightedVoting_average, @syncVotingAvg,"GaussianSynth",[],  false);
% f = msgbox("sync-WEIGHT AVG COMPLETED");


testCluster(ens_feat,3,20,1,n_it,  @relabelAndVote, @syncVoting,"GaussianSynth",[],  true);
f = msgbox("CLUSTER-SIMPLE COMPLETED");
% testCluster(ens_feat,3,20,1,n_it, @weightedVoting_simple, @syncVotingSmpl,"GaussianSynth",[],  false);
% f = msgbox("CLUSTER-WEIGHT SIMPLE COMPLETED");
% testCluster(ens_feat,3,20,1,n_it, @weightedVoting_average, @syncVotingAvg,"GaussianSynth",[],  false);
% f = msgbox("CLUSTER-WEIGHT AVG COMPLETED");
% 
%  
