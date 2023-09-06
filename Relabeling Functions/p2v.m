function v  = p2v( P , d)
% da matrice di permutazione a vettore
% se d = 2 lo mette in forma a due righe (Cauchy's two-line notation)
% se d = 1 one-line o word notation (default)
% gestisce anche permutazioni parziali (con 0 dove non definita)
%
% e.g. in two-line notation [1 2 3 4 5
%                            3 4 5 1 2] 
% means that the action is 1->3, 2->4, 3->5, 4->1, 5->2


if nargin <2 
    d=1;
end

n = size(P,1);
if d==2
v = [1:n; (1:n) * P'];
else
    v =(1:n) * P';
end

 
end

