
d=3; % number of groups
n=10; % number of points

x=randi(d,n,1); % random labels
X=sparse(1:n,x,1,n,d); % matrix representation
full(X)

P=[0 1 0;1 0 0;0 0 0]; % permutation matrix

Y=X*P; % change order of labels
full(Y) % matrix representation
y=zeros(n,1);
for i=1:n % go back to labels
    bb=find(Y(i,:));
    if ~isempty(bb)
        y(i)=find(Y(i,:));
    end
end
y

Q = ppa( X, Y , 'hungarian'); % finds Q such that Y=X*Q
full(Q)

% check that Q is the right permutation
norm(Q-P)