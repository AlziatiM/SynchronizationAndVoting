function plotMatrixList(x, cellY, graphtitles, legendLabel, graphxlabel, graphylabels, breakLimit, boldLines)
%PLOTMETRICS Summary of this function goes here
%   Detailed explanation goes here

if nargin < 7
    breakLimit = false;
end
all_marks = {'-o','-+','-*','-.','-x','-s','-d','-^','-v','->','-<','-p','-h'};
[r,c] = size(cellY{1});
clrs = turbo(r);
for i = 1: size(cellY,2)



    for j = 1:r
        if ismember(j, boldLines)
            lineWidth = 3;
        else
            lineWidth = 1;
        end
        plot( x,cellY{i}(j,:), all_marks{j}, "LineWidth", lineWidth);
        hold on
        if ~isempty(legendLabel)
            l = legend(legendLabel);
            l.Location = "bestoutside";
        end
    end
    title(graphtitles(i), 'Fontsize', 15)
    xlabel(graphxlabel, 'Fontsize', 15);
    ylabel(graphylabels(i), 'Fontsize', 15);

    maxV = max(cellY{i},[], "all");
%         if  ~breakLimit
%             ylim([0,min(max(cellY{i},[], "all")+ 0.1,1)]);
%         else
%             ylim([0,1.45+ 0.1]);
%             ylim([0,0.2+ 0.1]);
            ylim([0,0.85]);

%         end
    xlim([x(1), x(end)]);
    %     end
    colororder(clrs)
    grid on
    ax = gca;
    ax.LineWidth = 1.5;
    ax.FontSize = 20;
end













