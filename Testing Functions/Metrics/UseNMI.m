function NMI = UseNMI(partitionIndexA, partitionIndexB, PI)
%USENMI Summary of this function goes here
%   Detailed explanation goes here

%upper = 0;

pi_A = PI{partitionIndexA};
pi_B = PI{partitionIndexB};

% n_A = sum(pi_A, 1);
% n_B = sum(pi_B, 1);
% 
% 
% for h=1:K(partitionIndexA)
%     for l=1:K(partitionIndexB)
%         n_hl = sum(pi_A(:,h) == pi_B(:,l));
%         upper = upper + log2((N * n_hl)/(n_A(h)*n_B(l)));
% 
%     end
% end
% 
% lowerHalf_1 = 0;
% for h=1:K(partitionIndexA)
%     lowerHalf_1 = lowerHalf_1 + n_A(h)*log2(n_A(h)/N);
% end
% 
% lowerHalf_2 = 0;
% for l=1:K(partitionIndexB)
%     lowerHalf_2 = lowerHalf_2 + n_B(l)*log2(n_B(l)/N);
% end
% 
% lower = sqrt(lowerHalf_1*lowerHalf_2);
% 
% 
% NMI = upper / lower;
NMI = nmi(pi_A,pi_B);
end

