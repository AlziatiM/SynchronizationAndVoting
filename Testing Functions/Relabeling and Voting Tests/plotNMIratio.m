function plotNMIratio(nmi, nmi_gt,legendLabel)


hold on
clrs = turbo(size(nmi,1));
colororder(clrs)
for i = 1:size(nmi,1)
 scatter(nmi_gt(i),nmi(i),'filled','LineWidth',0.75 );
end
%  l = legend(legendLabel);
% l.Location = "bestoutside";
% title("Ratio between average NMI and NMI w.r.t. Ground Truth")
xlabel("NMI wrt GT")
ylabel("avg NMI wrt Ensemble")
ylim([0 1])
xlim([0 1])

hold off
end