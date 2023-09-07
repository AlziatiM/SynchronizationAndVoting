function NMI = UseNMI(partitionIndexA, partitionIndexB, PI)
%USENMI Summary of this function goes here
%   Detailed explanation goes here


pi_A = PI{partitionIndexA};
pi_B = PI{partitionIndexB};


NMI = nmi(pi_A,pi_B);
end

