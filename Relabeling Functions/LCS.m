
function pi_star = LCS(PI, K,const)
DEBUG = false;
M = size(PI,1);

G =cell(M,M);
for i =1:M
    for j = 1:M
        G{i,j}  = PI{i}'*PI{j};
    end
end

G = cell2mat(G);

prob = optimproblem('ObjectiveSense','max');
C_meta = optimvar("C_meta", size(G,1),K, "Type","integer","LowerBound",0,"UpperBound",1);
metaCLAssignUnconstr = optimeq(size(G,1));
for i = 1:size(G,1)
    metaCLAssignUnconstr(i) = sum(C_meta(i,:)) == 1;
end
prob.Constraints.metaCLAssignUnconstr = metaCLAssignUnconstr;

if const
    metaCLAssignConstr = optimeq(M*K);
    t = 1;
        for i = 1: K
            for j = 1: M
                metaCLAssignConstr(t) = sum(C_meta((j-1)*K+1:j*K,i)) == 1;
                t=t+1;
            end
            prob.Constraints.metaCLAssignConstr = metaCLAssignConstr;
        end
    

end
exp = optimexpr(size(G,1),K );
for i = 1:size(G,1)
    for j = 1:K

        exp(i,j) = C_meta(i,j)*((1/sum(C_meta(:,j))) * (sum(G(i, :)*C_meta(i,j)) - G(i,j)));

    end
end
expsum = optimexpr(1);

for m = 1:K
    for g = 1:M
        for t = 1:K
            expsum = expsum + C_meta((g-1)*K+t,m)*((1/sum(C_meta(:,m))) * (sum(G((g-1)*K+t, :)*C_meta((g-1)*K+t,m)) - G((g-1)*K+t,m)));
        end
    end
end



prob.Objective = expsum;
x0.C_meta =[eye(K);zeros(size(G,1)-K,K)];
if DEBUG
   C_sol = [0,1;1,0;1,0;0,1];

else

sol = solve(prob, x0);
C_sol = sol.C_meta;

end
F = zeros(size(PI{1},1),K);

for m = 1:K
    BASum = zeros(size(PI{1},1),1);
    for g = 1: M
       for t = 1:K
            BASum = BASum + PI{g}(:,t)*C_sol((g-1)*K+t,m);
       end
    
    end
  F(:,m) = (1 / sum(C_sol(:,m)) *BASum);
end
pi_star = majorityVoting(F);

end

