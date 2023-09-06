function relabeling = permutationConversion(relabeling)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[r,c] = size(relabeling);
numcol = max(relabeling);
if ~all(relabeling)
    ERROR = 1;
end
relabeling = [relabeling, zeros(r,numcol-1)];

if(c == 1)
    for i=1:r

        tmp = relabeling(i);
        relabeling(i) = 0;

        relabeling(i,tmp) = 1;

    end
end
end

