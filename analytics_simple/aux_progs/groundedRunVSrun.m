sa = loadResults('apex_height',1);

sg = sa.res{215};
sr = sa.res{225};

q = {sg,sr};
labels = {'grounded run','run'};
figure;
for i = 1:2
    subplot(1,2,i)
    plot(q{i}.t, q{i}.y);
    hold on;
    plot(q{i}.t, q{i}.param(12)+zeros(size(q{i}.t)),'r--');
    xlabel('time')
    ylabel('height')
    title(labels{i})
    axis([-.1 1 .85 1])
    text(mean(q{i}.t)-.2, q{i}.param(12)+.005,'Apex Height')
end
    