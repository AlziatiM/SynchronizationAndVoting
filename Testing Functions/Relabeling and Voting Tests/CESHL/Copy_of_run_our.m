clear
rand('state',0);
name='GLIOMA_50n_4434d_4c_uni';
load(name);
m=20;
n=length(y);
result_acc=zeros(10,7);
result_nmi=result_acc;

for iter=1:10
    SS=[];
    L=[];
    for j=1:m
        idxi=(iter-1)*20+j;
        YY=sparse(Yi{idxi});
        [kk,~]=find(YY');
        L(:,j)=kk;
        SS=[SS,YY];
    end
    [~,k]=size(SS);
    S=SS'*SS;
    d=1./sqrt(max(sum(S,2),eps));
    S=eye(size(S))-diag(d)*S*diag(d);
    S=(S+S')./2;
    w_ini=ranking(SS,m);
    c=length(unique(y));
    for lam=-3:3
        lambda=10.^lam;
        nk=length(w_ini);
        options = optimoptions('quadprog','Algorithm','trust-region-reflective','Display','off');
        w=quadprog(2.*(S+(lambda).*eye(nk)),-2.*(lambda)*w_ini',[],[],[],[],zeros(nk,1),ones(nk,1),[],options);
        [iter,lam]
        y_pred=CESHL( SS,w,4 );
        res=ClusteringMeasure(y,y_pred);
        result_acc(iter,lam+4)=res(1);
        result_nmi(iter,lam+4)=res(2);
    end
end
save(['./result/' name], 'result_acc', 'result_nmi');