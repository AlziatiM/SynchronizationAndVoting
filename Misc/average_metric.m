function [NMI_avg, ARI_avg] = average_metric(PI_LM, pi_starLV)


M = size(PI_LM,1);

NMIvec = zeros(M,1);
ARIvec = zeros(M,1);


for i = 1:M
    NMIvec(i) =  nmi(pi_starLV, PI_LM(i,:)');
    ARIvec(i) = useARI(pi_starLV, PI_LM(i,:)');
end

NMI_avg = mean(NMIvec);
ARI_avg = mean(ARIvec);

end

