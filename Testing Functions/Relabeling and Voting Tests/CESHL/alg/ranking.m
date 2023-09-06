function [ result ] = ranking( SS,m )
%RANKING �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

co_associat=1./m.*SS*SS';
[n,k]=size(SS);
result=zeros(1,k);
for i=1:k
    idx=find(SS(:,i));
    S_sub=co_associat(idx,idx);
    result(i)=sum(sum(S_sub))./(length(idx).^2);
end


end

