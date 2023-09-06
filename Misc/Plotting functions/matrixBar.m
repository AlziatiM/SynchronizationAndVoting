function  matrixBar(matrix, std_matrix, legendLabel,cat, name)
figure 
hold on
clrs = turbo(8);
colororder(clrs)
b = bar(cat, matrix);
    
% b(8).FaceColor = 	[0, 0, 1];
% if size(matrix) > 8
% b(9).FaceColor = 	[1, 0, 0];
% end
ngroups = size(matrix, 2);
nbars = size(matrix, 1);

groupwidth = min(0.8, nbars/(nbars + 1.5));
for i = 1:nbars
    x = (1:ngroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*nbars);
%     errorbar(x, matrix(i,:), std_matrix(i,:), '.');
end
title(name);
hold off
    l = legend(b,legendLabel);
        l.Location = "northeastoutside";
% errorbar(cat',matrix,std_matrix ,'.')

title(graphtitles(i), 'Fontsize', 15)
    xlabel(graphxlabel, 'Fontsize', 15);
    ylabel(graphylabels(i), 'Fontsize', 15);

end

