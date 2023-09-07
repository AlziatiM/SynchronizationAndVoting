function ACC = classificationAccuracy(pi_gt,pi)



[N,k] = size(pi);
k_gt = size(pi_gt, 2);
ACC = 0;


for i =1:k
    nij = zeros(k_gt,1);
    for j =1:k_gt
        for z = 1:N
            if pi(z,i) == 1 && pi_gt(z,j) == 1
                nij(j) = nij(j) +1;
            end
        end
    end
    ACC = ACC + max(nij)/N;

end