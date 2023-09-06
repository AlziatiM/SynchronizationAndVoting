function PI =  generatePartitionRandom(numPartitions, X , trueK, perc)
PI = cell(numPartitions,1);
% perc = [1:-0.025:0.525];
for i = 1: numPartitions
        if size(X,2) > 10
        X_sub = datasample(X,floor(size(X,2)*perc),2, "Replace",false);

        else
            X_sub = X;
        end

%     X_sub = X;

    id = randi(1);
    switch id
        case 1
            partition = kmeans(X_sub,trueK,"Start","uniform");
        case 2
            partition = kmedoids(X_sub,trueK,"Algorithm","large",'Options',statset('MaxIter',10));

        case 3
            rep = true;
            while(rep)
                try
                    partition = spectralcluster(X_sub,trueK );
                    rep = false;
                catch
                    rep = true;
                end
            end
        case 4
            partition = clusterdata(X_sub,'maxclust',trueK);
        case 5
            gm = fitgmdist(X_sub,trueK,"CovarianceType",	"diagonal",'SharedCovariance',true);
            partition = cluster(gm, X_sub);
        case 6
             
            partition = dbscan(X_sub,0.5,5,'Distance','squaredeuclidean');
    end
    if max(partition) ~= trueK || min(partition) < 1
        A = 1;
    end
    pi_i = fromLVtoBA(partition);
    PI{i} = pi_i;
end
