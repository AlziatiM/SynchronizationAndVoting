function PI = generatePartitionKMeans(numPartitions, X , trueK,variableK)
PI = cell(numPartitions,1);

if variableK
    if trueK >4 
    r = 3; %3
    else
        r = 1; %1
    end
else
    r = 0;
end
k_min = trueK -r;
k_max = trueK+ r;
for i = 1: numPartitions
    K = randi([k_min k_max]);
    partition = kmeans(X,K, "Start","uniform");
    pi_i = fromLVtoBA(partition);
    PI{i} = pi_i;
end

end


