function BA = fromLVtoBA(LV)
M =  max(LV);
N = size(LV,1);
BA= zeros(N,M);
for i =1:N
    BA(i,LV(i)) = 1;
end
end
