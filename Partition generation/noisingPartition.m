
function BA_i = noisingPartition(BA,p)
    BA_i = BA;
    k = size(BA,2);
    q = (1 -p)/(k -1);
    for i = 1: size(BA,1)
        l = label(i, BA);
        w = q*ones(1,k);
        w(l) = p;
        l_i = randsample([1:k],1,true,w);
        BA_i(i,l) = 0;
        BA_i(i,l_i) = 1;
           
    end

end

