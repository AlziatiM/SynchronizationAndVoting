    function [voteMatrix, V_cell] = syncVoting(pi_ref, pi_refLV,PI,PI_LM, PI_LMminusReference, T)
    
    M = size(PI,1);
    N = size(PI{1},1);
%     [s,d] = cellfun(@size,T);
%     K_max = max(s);
K_max = size(T{1},2);
V_cell = cell(M,1);

    voteMatrix = zeros(N,K_max);
    for i = 1:M
        
        vote = PI{i} * T{i,1};
        V_cell{i} = vote;
        voteMatrix = voteMatrix +vote;

    end
    

