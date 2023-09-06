function LV = fromBAtoLV(BA)
%FROMBATOLV convert a N x K Binary Association Matrix in the equivalent
% N x 1 label vector
% 
% LV = FROMBATOLV(BA)
N = size(BA,1);
LV = zeros(N,1);
for i = 1: N
    LV(i) = label(i,BA);
end

