function plotMatrixRows(x, cellY, graphtitles, legendLabel, graphxlabel, graphylabels)
%PLOTMETRICS Summary of this function goes here
%   Detailed explanation goes here

all_marks = {'-o','-+','-*','-.','-x','-s','-d','-^','-v','->','-<','-p','-h'};

[r,c] = size(cellY{1});


for i = 1: r

    figure 

    for j = 1:size(cellY,2)
      
    plot( x,cellY{j}(i,:), all_marks{j});
    hold on
    l = legend(legendLabel);
    l.Location = "bestoutside";
    end
    title(graphtitles(i))
    xlabel(graphxlabel);
    ylabel(graphylabels(i));
   ylim([0,min(max(cell2mat(cellY),[], "all")+ 0.2,1)]);

    grid on
    hold off
end













