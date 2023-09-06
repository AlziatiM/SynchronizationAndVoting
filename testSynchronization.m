function consensus = testSynchronization(method,K,PI,PI_LM,pi_ref, pi_refLV,PI_LMminusReference, voting, perc)



switch method 
    case 'NMF'
        syncmethod = @syncImplementationNMF;

    case 'QuickShift'
            syncmethod = @syncImplementationQuickShift;
    
    case'Pachauri'
                syncmethod = @syncImplementationPachauri;
    otherwise
        error('Error. \nChoosen implementation not available')
end


switch voting
    case 'Simple'
        votingFun = @relabelAndVote;

    case 'WeightSimple'
            votingFun = @weightedVoting_simple;
    
    case'WeightAverage'
                votingFun = @wei;
    otherwise
        error('Error. \nChoosen Voting technique not available')
end


syncedP = syncmethod(PI,PI_LM,perc,  false, K);
voteMatrix = votingFun(pi_ref, pi_refLV,PI,PI_LM,PI_LMminusReference, syncedP);

consensusBA = pluralityVoting(voteMatrix);
consensus = fromBAtoLV( consensusBA);

