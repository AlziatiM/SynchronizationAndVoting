dim  = 5*ones(20,1);
cumDim = [0;cumsum(dim(1:end-1))];
m = 100;
Z_pairwise = eye(m);
ncams=20;
membershipPrior=zeros(1,m); % image membership
        for k=1:ncams
            membershipPrior(1+cumDim(k):cumDim(k)+dim(k))=k;
        end
        % Compute tracks (the number of tracks is automatically recovered)
        [membershipCorrespondences,info]=quickshift_matching(Z_pairwise,membershipPrior,'similarity');

        tracks_quickMatch=max(membershipCorrespondences); % Number of tracks
        % Convert tracks into permutation matrices
        P_out=sparse(1:m,membershipCorrespondences,1,m,tracks_quickMatch);