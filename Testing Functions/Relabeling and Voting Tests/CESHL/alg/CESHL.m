function [ y] = CESHL( H_ini,w_ini,c )
%CEHG 此处显示有关此函数的摘要
%   此处显示详细说明

[~,n]=size(H_ini);
maxiter=100;
w=w_ini';
dv=sum(bsxfun(@times,H_ini,w),2);
de=1./max(sum(H_ini),eps);
wde=w.*de;
hwde=bsxfun(@times,H_ini,wde);
L=diag(dv)-hwde*H_ini';
[Y, ~, evs]=eig1(L, c, 0);
H=H_ini;
rho=100;
lr1=2;
for i=1:maxiter
    H=LBFGSB1( H_ini,w,Y,rho,H  );
    de=1./max(sum(H),eps);
   
    dv=sum(bsxfun(@times,H,w),2);
    
    wde=w.*de;
    hwde=bsxfun(@times,H,wde);
    L=diag(dv)-hwde*H';
    Y_old = Y;
    [Y, ~, ev]=eig1(L, c, 0);
    evs(:,i+1) = ev;
    
    fn1 = sum(ev(1:c));
    fn2 = sum(ev(1:c+1));
    if fn1 > 0.000000001
        rho = lr1*rho;
    elseif fn2 < 0.00000000001
        rho = rho/lr1;  Y = Y_old;
    elseif i>1
        break;
    end
    
end
S=hwde*H';
[~, y]=graphconncomp(sparse(S));

