function consensus = synchronizationAndVoting(method,voting,PI,trueK,perc, pi_ref)



switch method
    case 'NMF'
        permSync = @SV_NMF;

    case 'QM'
        permSync = @SV_QM;

    case'EIG'
        permSync = @SV_EIG;
    otherwise
        error('Choosen implementation not available.')
end




U = permSync(PI,perc,trueK);


voteMatrix = syncVoting(pi_ref,PI, U, voting);

consensusBA = pluralityVoting(voteMatrix);
consensus = fromBAtoLV(consensusBA);

