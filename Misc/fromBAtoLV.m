function LV = fromBAtoLV(BA)
N = size(BA,1);
LV = zeros(N,1);
for i = 1: N
    LV(i) = label(i,BA);
end

