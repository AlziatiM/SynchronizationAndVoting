function PI = generatePartitionKMeans(numPartitions, X , trueK,p)

[N,d] = size(X);
PI = cell(numPartitions,1);
if trueK >4 
r = 3;
else
    r = 1;
end
k_min = trueK -r;
k_max = trueK+ r;
for i = 1: numPartitions
    [X_sub, idx] = datasample(X,N*0.9,'Replace',false);
    
    K = randi([k_min k_max]);
    pi_i = zeros(N,K);

    partition = kmeans(X_sub,K, "Start","uniform");
    pi_sub = fromLVtoBA(partition);
    pi_i(idx,:) = pi_sub;
%     pi_ii = noisingPartition(pi_i, p);
    PI{i} = pi_i;
end

end


