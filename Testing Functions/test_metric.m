function metricResult = test_metric(metricName, partitionIndexA, partitionIndexB, PI, N, K)

switch(metricName)
    case "NMI"
        metricResult = UseNMI(partitionIndexA, partitionIndexB, PI);
    case "ARI"
        metricResult = useARI(partitionIndexA, partitionIndexB, PI, N, K);

end

end
