function voteMatrix = syncVoting(pi_ref, PI,  U, voting)


M = size(PI,1);
N = size(PI{1},1);

K_output = size(U{1},2);
V_cell = cell(M,1);


pi_refLV = fromBAtoLV(pi_ref);
PI_LM =EnsembleLabelMatrix(PI);

switch voting
    case 'simple'
        weights = ones(M,1);

    case 'weightSimple'
        weights = computeWeights(pi_refLV, PI_LM, 'simple'  );

    case'weightAverage'
        weights = computeWeights(pi_refLV, PI_LM, 'average'  );
    otherwise
        error('Choosen Voting technique not available')
end







voteMatrix = zeros(N,K_output);
for i = 1:M

    unweightedVote = PI{i} * U{i,1};
    V_cell{i} = unweightedVote;
    voteMatrix = voteMatrix + weights(i)*unweightedVote;
end


