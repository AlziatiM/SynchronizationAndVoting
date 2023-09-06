function [voteMatrix, V_cell] = weightedVoting(relabelingAlgorithmName, pi_reference,pi_referenceLV,PI,PI_LM, PI_minusReference,PI_LMminusReference)
%RELABELANDVOTE create a voting matrix given a reference partition and an
% ensemble
%   
%   VOTEMATRIX = relabelAndVote(RELABELINGALGORITHMNAME, PI_REFERENCE, PI_MINUSREFERENCE)
%   returns the matrix VOTEMATRIX containing all the votes obtained from 
%   the ensemble where a partition PI_REFERENCE is taken as a reference
%   partition and all the other partitions in the ensemble PI_MINUSREFERENCE
%   are relabeled to match the reference using the algorithm specified by
%   the RELABELINGALGORITHMNAME parameter.
%   

weightType = "simple";
weights = computeWeights(pi_referenceLV, PI_LM, weightType  );

[N, K_max] = size(pi_reference);

voteMatrix =zeros(N, K_max);

M = size(PI,1);
V_cell = cell(M,1);


for i=1:M
        pi = PI{i};
         piLV = PI_LM(i,:)';
         unweightedVote = relabel(pi_reference,pi_referenceLV, pi,piLV, relabelingAlgorithmName);
       V_cell{i} = unweightedVote;
         
   if((size(unweightedVote,1) ~= size(voteMatrix,1)) || (size(unweightedVote,2) ~= size(voteMatrix,2)))
       ERROR = 1;
   end


    



    voteMatrix = voteMatrix + weights(i)*unweightedVote;
end

end