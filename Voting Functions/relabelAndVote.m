function [voteMatrix, V_cell] = relabelAndVote(relabelingAlgorithmName, pi_reference,pi_referenceLV,PI, PI_LM, PI_minusReference,PI_LMminusReference)
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
voteMatrix = pi_reference;
M_minusReference = size(PI_minusReference,1);
V_cell = cell(M_minusReference+1,1);
V_cell{1} = pi_reference;

for i=1:M_minusReference
        pi = PI_minusReference{i};
        piLV = PI_LMminusReference(i,:)';
    
         vote = relabel(pi_reference, pi_referenceLV, pi,piLV,relabelingAlgorithmName);
       
       V_cell{i+1} = vote;  


    voteMatrix = voteMatrix +vote;

end

end