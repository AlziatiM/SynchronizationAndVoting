function [voteMatrix, V_cell] = syncVotingAvg(pi_ref, pi_refLV,PI,PI_LM,PI_LMminusReference, T)

M = size(PI,1);

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


K_max = size(T{1},2);
V_cell = cell(M,1);

% PI_LM = EnsembleLabelMAtrix(PI);

weightType = "average";
weights = computeWeights(pi_refLV, PI_LM, weightType  );

voteMatrix = zeros(size(PI{1},1),K_max);
for i = 1:M

    unweightedVote = PI{i} * T{i,1};
    V_cell{i} = unweightedVote;
    voteMatrix = voteMatrix + weights(i)*unweightedVote;
end

end
