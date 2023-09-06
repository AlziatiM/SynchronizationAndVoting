function [ obj,grad ] = obj_f2( H_ini,w,Y,rho,x )
%d:1*k
%dv:n*1
%w:1*k

[n,k]=size(H_ini);
H=reshape(x,n,k);

% dv:n*1
dv=1./sqrt(max(sum(bsxfun(@times,H,w),2),eps));
%de:1*k
de=1./max(sum(H),eps);

H_Hini=H-H_ini;
H_Hini_w=bsxfun(@times,H_Hini,w);
obj1=sum(sum(H_Hini_w.^2));
obj2=0;

DvH=bsxfun(@times,H,dv);
YDvH=Y'*DvH;
DeW=w.*de;
WDe2=DeW.*de;
YDvHDeW=bsxfun(@times,YDvH,DeW);
obj4=rho*sum(sum(YDvHDeW.*YDvH));

obj=obj1+obj2-obj4;

grad1=bsxfun(@times,2*(H-H_ini),w.^2);
grad2=0;

YDvHDeW2=bsxfun(@times,YDvH,WDe2);
grad3=repmat(sum(YDvH.*YDvHDeW2),n,1);

WDeHDvY=YDvHDeW';
HWDeHDvY=H*WDeHDvY;
grad4=(sum(HWDeHDvY.*Y,2).*(dv.^3))*w;

grad5=-2.*bsxfun(@times,Y*YDvHDeW,dv);



grad=grad1+grad2+rho.*(grad3+grad4+grad5);
grad=reshape(grad,n*k,1);




end

