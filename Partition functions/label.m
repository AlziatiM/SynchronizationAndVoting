



function index = label(pointId, BA)
%LABEL find the label associated to an element in a specific Binary
%           Association Matrix
% 
% index = LABEL(pointId, BA)
% 
% pointId is the row number of the interested element
BA_row = BA(pointId,:);
[~,index] = max(BA_row); 
end
