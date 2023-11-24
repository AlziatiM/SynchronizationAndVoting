function LM = EnsembleLabelMatrix(PI)
%ENSEMBLELABELMATRIX convert a M x 1 collection of Binary Association Matrices in an equivalent
% M x N label matrix
% 
% LM = EnsembleLabelMatrix(PI)
M = size(PI,1);
N = size(PI{1},1);
LM = zeros(M,N);
for i = 1:M
    LM(i,:) = fromBAtoLV(PI{i})';
end
end

