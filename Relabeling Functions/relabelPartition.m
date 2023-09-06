function pi_relabeled = relabelPartition(pi_reference,relabelingAssignment, pi)
%RELABELPARTITION relabel a partition in order to have its relabeled
%   clusters aligned to the clusters of a reference partition
%
%   PI_RELABELED = relabelPartition(PI_REFERENCE, RELABELINGASSIGNMENT, PI)
%   returns the relabeled BA matrix of PI, which has the same shape of the
%   PI_REFERENCE partition, with the clusters corresponding to the
%   relabeling specified in RELABELINGASSIGNMENT
%



if size(pi_reference, 2) == size(pi, 2)
    % if both partitions have the same number of clusters, just permute the
    % columns using the relabeling
    pi_relabeled = pi(:,relabelingAssignment);
else
    % otherwise create a new versione of pi_relabeled that matches the
    % shape of the reference partition
    pi_relabeled = zeros(size(pi_reference, 1), size(pi_reference, 2));


    for j=1:size(pi_reference,2)
        for i=1:size(pi_reference, 1)
            pi_relabeled(i,j) = pi(i, relabelingAssignment(j));
        end
    end

end


end

