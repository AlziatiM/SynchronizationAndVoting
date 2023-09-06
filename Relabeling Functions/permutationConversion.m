function P = permutationConversion(labelVector)

[r,c] = size(labelVector);
numcol = max(labelVector);


P = [labelVector, zeros(r,numcol-1)];

if(c == 1)
    for i=1:r

        tmp = P(i);
        P(i) = 0;

        P(i,tmp) = 1;

    end
end
end

