function BA_ii = permutePartition(BA)
k = size(BA,2); 
i = randperm(k);

BA_ii = BA(:, i);
end

