function [ result ] = ranking( SS,m )
%RANKING 此处显示有关此函数的摘要
%   此处显示详细说明

co_associat=1./m.*SS*SS';
[n,k]=size(SS);
result=zeros(1,k);
for i=1:k
    idx=find(SS(:,i));
    S_sub=co_associat(idx,idx);
    result(i)=sum(sum(S_sub))./(length(idx).^2);
end


end

