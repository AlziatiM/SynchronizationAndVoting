function BA = fromLVtoBA(LV)
%FROMLVTOBA convert a N x 1 label vector in the equivalent
% N x K Binary Association Matrix
% 
% BA = FROMLVTOBA(LV)
M =  max(LV);
N = size(LV,1);
BA= zeros(N,M);
for i =1:N
    BA(i,LV(i)) = 1;
end
end
