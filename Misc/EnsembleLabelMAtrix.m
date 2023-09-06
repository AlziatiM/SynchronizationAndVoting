function LM = EnsembleLabelMatrix(PI)

M = size(PI,1);
N = size(PI{1},1);
LM = zeros(M,N);
for i = 1:M
    LM(i,:) = fromBAtoLV(PI{i})';
end
end

