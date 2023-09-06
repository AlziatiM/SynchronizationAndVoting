function s= matrixBox(matrix, legendLabel, cat, name, label)
clrs = turbo(8);

boxchart( matrix,'HandleVisibility','on');


hold on
N = size(matrix,2);


%  clrs = turbo(size(matrix,1));
%  colororder(clrs);
clrs = turbo(8);
%  colororder(clrs([1,2,3,4],:));
 colororder(clrs([1,5:8],:));

s = scatter([1:N], matrix, 100,'filled');

% l = legend(s,legendLabel);
% l.Location = "bestoutside";
set(gca,'xticklabel',cat, 'FontSize', 15)
title(name, 'Fontsize', 15)
maxV = max(matrix,[],'all');
if maxV > 1
  ylim([0 3])  
else
    ylim([0 1])
end
ylabel(label)
hold off
end