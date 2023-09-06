function PI = generatePartitions(numPartitions, groundTruth,    p)

PI = cell(numPartitions,1);
for i = 1: numPartitions
    pi_i = noisingPartition(groundTruth, p);
   pi_ii = permutePartition(pi_i);
    PI{i} = pi_ii;
end

end

