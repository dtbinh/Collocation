% MHector
% 8.14.18
% COL analysis
clc; clear; %close all
record_video = 0;
if record_video==1
    v=VideoWriter('Apex_velocity','MPEG-4');
    v.FrameRate=5;
    open(v);
end

varName = 'apex_height';

sa = loadResults('apex_height',1);

s = loadResults('apex_height',0);

varmaxplot = 1;
varminplot = .9;
energyMax = .7;
plotName = 'Apex Height';

fig = figure;
an1 = plot(1,1,'b'); hold on; an2 = plot(1,1, 'r'); %an11 = plot(1,1,'bo'); an21 = plot(1,1,'ro');


Ylim =.04;
% makeVref = @(t, p) plot([t, t],[Ylim,Ylim], 'LineStyle','--','Color','r', 'LineWidth',1.4);
% an2 = makeVref(0,an1);
% an3 = makeVref(1,an1);
% axis([-1.2,1.2, 0, Ylim]); 
axis([-.1,1.1, 0, Ylim]); 
title1 = title('anklesRkool');
legend('no ankle','ankle')

tc = 0:.01:pi;
% plot(cos(tc),sin(tc),'k');

i = 1;
while s.var_graph(i) < varmaxplot

   if (s.res{i}.collParam.flag > 0) && (s.var_graph(i) > varminplot)
        e = get_energy3(s.res{i},0);
%           an1.XData = s.res{i}.t(1:end-1);
%           an1.YData = e.cumIn';
%         full = stance2Full(s.res{i});
%         ankleMax = full.param(8)/2 .*full.Fleg .* full.y ./ full.r; 
%         an1.XData = full.t./full.t(end);
%         an1.XData = s.res{i}.x;
%         an1.XData = full.x;
%         an1.YData = full.Tankle;
%         an1.YData = full.r;
%         an1.YData = full.y;
%         an1.YData = -ankleMax;
%         an1.YData = s.res{i}.y;

        
%         an11.XData = [full.t(full.stanceStartN)./full.t(end), full.t(full.stanceEndN)./full.t(end)];
%         an11.XData = [full.x(full.stanceStartN), full.x(full.stanceEndN)];
%         an11.YData = [full.r0(full.stanceStartN), full.r0(full.stanceEndN)];
%        an11.YData = [full.r(full.stanceStartN), full.r(full.stanceEndN)];

%         an2.XData = [full.stanceStartTime./full.t(end), full.stanceStartTime./full.t(end)];
%         an2.YData = an2.Parent.YLim;
%         an3.XData = [full.stanceEndTime./full.t(end), full.stanceEndTime./full.t(end)];
%         an3.YData = an3.Parent.YLim;
        
%         an2.XData = [full.x(full.t == full.stanceStartTime), full.x(full.t == full.stanceStartTime)];
%         an2.YData = an2.Parent.YLim;
%         an3.XData = [full.x(full.t == full.stanceEndTime), full.x(full.t == full.stanceEndTime)];
%         an3.YData = an3.Parent.YLim;

        
        fullsa = stance2Full(sa.res{i});
%         an2.XData = s.res{i}.t(1:end-1);
%         an2.YData = e.cumOut';
        an2.XData = fullsa.t./fullsa.t(end);
%         an2.XData = sa.res{i}.x;
%         an2.XData = fullsa.x;
        an2.YData = fullsa.Tankle;
%         an2.YData = fullsa.r;
%         an2.YData = fullsa.y;
%         an2.YData = sa.res{i}.y;
        
%         an21.XData = [fullsa.t(full.stanceStartN)./full.t(end), fullsa.t(full.stanceEndN)./full.t(end)];
%         an21.XData = [fullsa.x(full.stanceStartN), fullsa.x(full.stanceEndN)];
%         an21.YData = [fullsa.r0(full.stanceStartN), fullsa.r0(full.stanceEndN)];
%         an21.YData = [fullsa.r(full.stanceStartN), fullsa.r(full.stanceEndN)];
        axis equal
        
        title1.String = ['Apex Height = ', num2str(s.var_graph(i))];
        drawnow
        pause(.01)
        if record_video==1
            F=getframe(gcf);
            writeVideo(v,F);
        end
    end
    i = i + 1;
end

if record_video == 1
    close(v)
end

% Energy figure
figure;
plot(sa.var_graph, sa.eLegMech); hold on;
plot(sa.var_graph, sa.eAnkleMech);
legend('Leg mechanical','Ankle mechanical')
title('Energy usage between leg and ankle as apex height increases')
xlabel('Apex height'); ylabel('Energy contribution (J)')

% figure; plot(s.var_graph,s.groundedRunMeasure); ylabel('Time in air / Time in stance'); xlabel('Apex height')

figure;
yyaxis left
plot(sa.var_graph,sa.groundedRunMeasure); ylabel('Time in air / Time in stance','Color',[0 .447 .741]);
yyaxis right
plot(sa.var_graph,sa.rInitial); ylabel('Touchdown leg length','Color',[.85 .325 .098])
xlabel('Apex Height');
title('Grounded running in actuated SLIP')

figure; subplot(3,1,1)
plot(sa.var_graph,sa.rInitial); hold on; plot(s.var_graph, s.rInitial); 
title('Touchdown leg length as apex height increases')
ylabel('Touchdown leg length'); xlabel('Apex height')
axis([.5,1.35,.55,1.1])
hold on; plot([.92, .92],[.55,1.1], 'LineStyle','--','Color','r', 'LineWidth',1.4)
hold on; plot([1.07, 1.07],[.55,1.1], 'LineStyle','--','Color','r', 'LineWidth',1.4)
legend('With Ankle','Without Ankle')

subplot(3,1,3)
plot(sa.var_graph,sa.eAnkleMech)
ylabel('Energy contribution from ankle')
plot(sa.var_graph,sa.eAnkleMech/(sa.eAnkleMech+sa.eLegMech)*100)
plot(sa.var_graph,sa.eAnkleMech./(sa.eAnkleMech+sa.eLegMech)*100)
title('Ankle energy contribution to total energy of gait, percent')
ylabel('Ankle energy contribution')
xlabel('Apex Height')
hold on; plot([.93, .93],[0,80], 'LineStyle','--','Color','r', 'LineWidth',1.4)
hold on; plot([1.07, 1.07],[0,80], 'LineStyle','--','Color','r', 'LineWidth',1.4)
axis([.5,1.35,0,80])

subplot(3,1,2)
plot(sa.var_graph,sa.rFinal); hold on; plot(s.var_graph, s.rFinal); 
title('Liftoff leg length as apex height increases')
ylabel('Liftoff leg length'); xlabel('Apex height')
axis([.5,1.35,.55,1.1])
hold on; plot([.92, .92],[.55,1.1], 'LineStyle','--','Color','r', 'LineWidth',1.4)
hold on; plot([1.07, 1.07],[.55,1.1], 'LineStyle','--','Color','r', 'LineWidth',1.4)
legend('With Ankle','Without Ankle')




figure;
subplot(2,1,2)
plot(sa.var_graph,sa.eAnkleMech./(sa.eAnkleMech+sa.eLegMech)*100)
title('Percent total energy contribution from ankle')
ylabel('Ankle energy contribution')
xlabel('Apex Height')
hold on; plot([.93, .93],[0,80], 'LineStyle','--','Color','r', 'LineWidth',1.4)
hold on; plot([1.0, 1.0],[0,80], 'LineStyle','--','Color','r', 'LineWidth',1.4)
axis([.7,1.3,0,70])

subplot(2,1,1)
plot(sa.var_graph,sa.groundedRunMeasure); ylabel('Time in air / Time in stance');
hold on; plot(s.var_graph,s.groundedRunMeasure); 
xlabel('Apex Height')
title('Grounded run measure')
hold on; plot([.93, .93],[0,2.5], 'LineStyle','--','Color','r', 'LineWidth',1.4)
hold on; plot([1.0, 1.0],[0,2.5], 'LineStyle','--','Color','r', 'LineWidth',1.4)
axis([.7,1.3,0,2.5])
legend('With ankle', 'Without ankle')

figure
q= sa;
subplot(1,2,1)
a = 9; b=213;
for i = a:b
%     pause
    plot(q.res{i}.t./q.res{i}.t(end),q.res{i}.r,'Color',[1-i/b, i/b, 0]);
    [q.res{i}.param(12), i];
    if round(q.res{i}.param(12),3) == .93
        plot(q.res{i}.t./q.res{i}.t(end),q.res{i}.r,'LineStyle','--','Color','r', 'LineWidth',1.4);
    end
    hold on
end
axis([0 1 .5 1.01])
xlabel('Normalized stance time')
ylabel('Leg length through stance')
title('Grounded running')

subplot(1,2,2)
a = 214; b=380;
for i = a:b
%     pause
    plot(q.res{i}.t./q.res{i}.t(end),q.res{i}.r,'Color',[0, 1-(i-a)/(b-a), (i-a)/(b-a)]);
    [q.res{i}.param(12), i];
    if round(q.res{i}.param(12),3) == 1.07
        plot(q.res{i}.t./q.res{i}.t(end),q.res{i}.r,'LineStyle','--','Color','r', 'LineWidth',1.4);
    end
    hold on
end
axis([0 1 .5 1.01])
xlabel('Normalized stance time')
ylabel('Leg length through stance')
title('Running with flight')



q = sa;
subplot(2,2,1)
a = 214; b=283;
for i = a:b
%     pause
    plot(q.res{i}.t./q.res{i}.t(end),q.res{i}.r,'Color',[0, 1-(i-a)/(b-a), (i-a)/(b-a)]);
    [q.res{i}.param(12), i];
    if round(q.res{i}.param(12),3) == 1.07
%         plot(q.res{i}.t./q.res{i}.t(end),q.res{i}.r,'LineStyle','--','Color','r', 'LineWidth',1.4);
    end
    hold on
end
axis([0 1 .5 1.01])
xlabel('Normalized stance time')
ylabel('Leg length through stance')
title('Transistion with ankle')

q=s;
subplot(2,2,2)
a = 214; b=283;
for i = a:b
%     pause
    plot(q.res{i}.t./q.res{i}.t(end),q.res{i}.r,'Color',[0, 1-(i-a)/(b-a), (i-a)/(b-a)]);
    [q.res{i}.param(12), i];
    if round(q.res{i}.param(12),3) == 1.07
%         plot(q.res{i}.t./q.res{i}.t(end),q.res{i}.r,'LineStyle','--','Color','r', 'LineWidth',1.4);
    end
    hold on
end
axis([0 1 .5 1.01])
xlabel('Normalized stance time')
ylabel('Leg length through stance')
title('Transistion without ankle')


subplot(2,2,[3 4])
a = 214; b=283;
for i = a:b
%     pause
    t = linspace(0,1);
    rN = interp1(s.res{i}.t./s.res{i}.t(end),s.res{i}.r,t);
    rA = interp1(sa.res{i}.t./sa.res{i}.t(end),sa.res{i}.r,t);
    plot(t,rA-rN,'Color',[0, 1-(i-a)/(b-a), (i-a)/(b-a)]);
    [q.res{i}.param(12), i];
    if round(q.res{i}.param(12),3) == 1.07
%         plot(t,rA-rN,'Color',[0, 1-(i-a)/(b-a), (i-a)/(b-a)]);
    end
    hold on
end
% axis([0 1 .5 1.01])
xlabel('Normalized stance time')
ylabel('Difference in leg length through stance')
title('Transistion difference (ankle - no ankle)')


%Cost of transport graph
figure; subplot(2,1,1)
plot(sa.var_graph, sa.cost_graph); hold on;
plot(s.var_graph, s.cost_graph);
legend('With ankle','Without ankle')
title('Cost of transport comparison')
ylabel('Cost of transport')
xlabel('Apex Height')

subplot(2,1,2)
[sVarU, su] = unique(s.var_graph);
sCost = s.cost_graph(su);
[saVarU, sau] = unique(sa.var_graph);
saCost = sa.cost_graph(sau);

saVarU = saVarU(1:590);
sau = sau(1:590);
saCost = sa.cost_graph(sau);
assert(saVarU(1) == sVarU(1),'make sure these are the same')

nu = 100*(sCost(1:length(saVarU)) - saCost)./sCost(1:length(saVarU));
plot(sVarU(1:length(saVarU)), nu)
title('Energy efficiency increase by using ankle')
ylabel('Percent efficiceny increase'); xlabel('Apex Height')


%Touchdown angle
figure; plot(sa.var_graph, sa.tdA); hold on; plot(s.var_graph, s.tdA); 
legend('With Ankle', 'Without Ankle')
xlabel('Apex Height')
ylabel('Touchdown Angle')
title('Touchdown angle')

%Compaing TD and LO r's
figure
subplot(2,2,1)
plot(s.var_graph, s.rInitial); hold on; plot(s.var_graph, s.rFinal);
legend('Touchdown leg length','Liftoff leg length','Location','northwest');
xlabel('Apex Height');
ylabel('Leg length [m]');
title('Leg lengths with no ankle')

subplot(2,2,2)
plot(sa.var_graph, sa.rInitial); hold on; plot(sa.var_graph, sa.rFinal);
legend('Touchdown leg length','Liftoff leg length','Location','northwest');
xlabel('Apex Height');
ylabel('Leg length [m]');
title('Leg lengths with ankle')

lenVar = floor(length(s.var_graph)*2/3);
subplot(2,2,3)
plot(s.var_graph, s.yInitial); hold on; plot(s.var_graph, s.yFinal);
plot(s.var_graph(1:lenVar),s.var_graph(1:lenVar),'b--')
legend('Touchdown COM height','Liftoff COM height','Apex height','Location','northwest');
xlabel('Apex Height');
ylabel('Height [m]');
title('Touchdown height')

subplot(2,2,4)
plot(sa.var_graph, sa.yInitial); hold on; plot(sa.var_graph, sa.yFinal);
plot(s.var_graph(1:lenVar),s.var_graph(1:lenVar),'b--')
legend('Touchdown COM height','Liftoff COM height','Apex height','Location','northwest');
xlabel('Apex Height');
ylabel('Height [m]');
title('Touchdown height')

%Distances
figure
subplot(4,1,1)
plot(s.var_graph,s.distance); hold on; plot(sa.var_graph, sa.distance);
xlabel('Apex Height'); ylabel('Distance traveled [m]'); title('Distance traveled by SLIP')
legend('No ankle','Ankle')

subplot(4,1,2)
plot(s.var_graph,s.eLegMech + s.eAnkleMech); hold on; plot(sa.var_graph, sa.eLegMech + sa.eAnkleMech);
xlabel('Apex Height'); ylabel('Sum of energy into system'); title('Energy In')
legend('No ankle','Ankle')

subplot(4,1,3)
[sVarU, su] = unique(s.var_graph);
sCost = s.cost_graph(su);
[saVarU, sau] = unique(sa.var_graph);
saCost = sa.cost_graph(sau);

saVarU = saVarU(1:590);
sau = sau(1:590);
saCost = sa.cost_graph(sau);
assert(saVarU(1) == sVarU(1),'make sure these are the same')

nu = 100*(sCost(1:length(saVarU)) - saCost)./sCost(1:length(saVarU));
plot(sVarU(1:length(saVarU)), nu)
title('Percent decrease of cost of transport')
ylabel('Percent efficiceny increase'); xlabel('Apex Height')

subplot(4,1,4)
plot(s.var_graph, s.rInitial); hold on; plot(sa.var_graph, sa.rInitial);
legend('No Ankle','Ankle');
xlabel('Apex Height');
ylabel('Leg length on touchdown [m]');
title('Leg lengths on touchdown')

%delta r0
figure
plot(s.var_graph,s.distance); hold on; plot(sa.var_graph, sa.distance);
xlabel('Apex Height'); ylabel('Distance traveled [m]'); title('Distance traveled by SLIP')
legend('No ankle','Ankle')

%whatever
figure
wut = 'distance';
plot(s.var_graph,s.(wut)); hold on; plot(sa.var_graph, sa.(wut)); 
xlabel('Apex Height'); title(wut); legend('No ankle', 'Ankle')


%TD pos
figure
plot(s.xInitial(600:800),s.yInitial(600:800),'o'); hold on; plot(s.xFinal(600:800), s.yFinal(600:800),'o'); 
xlabel('XPosition'); title('Touchdown Positions'); legend('Touchdown', 'Liftoff')




%Distances v2
figure
subplot(5,2,[1 2])
dp1 = plot(s.var_graph,s.distance); hold on; plot(sa.var_graph, sa.distance);
xlabel('Apex Height'); ylabel('Distance traveled [m]'); title('Distance traveled by SLIP')
drawthelines(dp1)
text(.8, 1.6,'1','FontSize',30,'interpreter','latex','HorizontalAlignment','center');
text(.935, 1.6,'2','FontSize',30,'interpreter','latex','HorizontalAlignment','center');
text(.968, 1.6,'3','FontSize',30,'interpreter','latex','HorizontalAlignment','center');
text(1.15, 1.6,'4','FontSize',30,'interpreter','latex','HorizontalAlignment','center');
legend('No ankle','Ankle')


subplot(5,2,[3 4])
mgd = s.res{1}.param(1)*s.res{1}.param(10)*s.distance;
mgda = sa.res{1}.param(1)*sa.res{1}.param(10)*sa.distance;
dp2 = plot(s.var_graph,s.cost_graph.*mgd); hold on; plot(sa.var_graph, sa.cost_graph .* mgda);
xlabel('Apex Height'); ylabel('Sum of energy into system'); title('Energy In')
drawthelines(dp2)
legend('No ankle','Ankle')

subplot(5,2,[5 6])
nu = 100*(s.cost_graph - sa.cost_graph)./s.cost_graph;
dp0 = plot(s.var_graph, nu); hold on;
drawthelines(dp0)
title('Percent decrease of cost of transport')
ylabel('Percent efficiceny increase'); xlabel('Apex Height')

subplot(5,2,[7 8])
dp3 = plot(s.var_graph, s.rInitial); hold on; plot(sa.var_graph, sa.rInitial);
drawthelines(dp3)
legend('No Ankle','Ankle');
xlabel('Apex Height');
ylabel('Leg length on touchdown [m]');
title('Leg lengths on touchdown')

subplot(5,2,9)
lenVar = floor(length(s.var_graph)*.45);

dp4 = plot(s.var_graph, s.yInitial); hold on; plot(sa.var_graph, sa.yInitial);
plot(s.var_graph(1:lenVar),s.var_graph(1:lenVar),'b--')
drawthelines(dp4)
legend('No Ankle','Ankle','Apex height','Location','northwest');
xlabel('Apex Height');
ylabel('Height [m]');
title('Touchdown height')

subplot(5,2,10)
lenVar = floor(length(s.var_graph)*.45);
dp5 = plot(s.var_graph, s.yFinal); hold on; plot(sa.var_graph, sa.yFinal);
plot(s.var_graph(1:lenVar),s.var_graph(1:lenVar),'b--')
drawthelines(dp5)
legend('No Ankle','Ankle','Apex height','Location','northwest');
xlabel('Apex Height');
ylabel('Height [m]');
title('Liftoff height')


figure
nu = 100*(s.cost_graph - sa.cost_graph)./s.cost_graph;
plot(.9291,2.8,'bo');
hold on; plot(.9272,2.65,'rs')
dp0 = plot(s.var_graph, nu); hold on;
drawthelines(dp0)
text(.8, 1.6,'1','FontSize',30,'interpreter','latex','HorizontalAlignment','center');
text(.935, 1.6,'2','FontSize',30,'interpreter','latex','HorizontalAlignment','center');
text(.968, 1.6,'3','FontSize',30,'interpreter','latex','HorizontalAlignment','center');
text(1.15, 1.6,'4','FontSize',30,'interpreter','latex','HorizontalAlignment','center');
title('Percent decrease of cost of transport')
ylabel('Percent efficiceny increase'); xlabel('Apex Height')
text(1.15,8,'\% Decrease in $COT = 100 * \frac{COT_{No \ Ankle} - COT_{Ankle}}{COT_{No \ Ankle}}$','Interpreter','latex','FontSize',20,'HorizontalAlignment','center')
text(.8,8,'$COT = \frac{\int \ |E_{in}| \ dt}{mgd}$','Interpreter','latex','FontSize',20,'HorizontalAlignment','center')
legend('Optimal with ankle','Optimal without ankle')

%Zone 2
figure
zInds = find(round(s.var_graph,4) == .926);
zInds = zInds:find(round(s.var_graph,4) == .948);
subplot(2,2,1)
mgd = s.res{1}.param(1)*s.res{1}.param(10)*s.distance;
mgda = sa.res{1}.param(1)*sa.res{1}.param(10)*sa.distance;
plot(s.var_graph(zInds),s.cost_graph(zInds).*mgd(zInds)); hold on; 
plot(sa.var_graph(zInds), sa.cost_graph(zInds) .* mgda(zInds));
xlabel('Apex Height'); ylabel('Energy [J]'); title('Energy Dissipated')
legend('No Ankle','Ankle')

subplot(2,2,2)
plot(s.var_graph(zInds), s.distance(zInds)); hold on;
plot(sa.var_graph(zInds), sa.distance(zInds));
xlabel('Apex Height'); ylabel('Distance [m]'); title('Distance traveled by SLIP')
legend('No Ankle','Ankle')

subplot(2,2,3)
plot(s.var_graph(zInds), s.rInitial(zInds)); hold on;
plot(sa.var_graph(zInds), sa.rInitial(zInds));
xlabel('Apex Height'); ylabel('Length [m]'); title('Leg length on touchdown')
legend('No Ankle','Ankle')

subplot(2,2,4)
plot(s.var_graph(zInds), s.tdA(zInds)); hold on;
plot(sa.var_graph(zInds), sa.tdA(zInds));
xlabel('Apex Height'); ylabel('Angle [rad]'); title('Touchdown angle')
legend('No Ankle','Ankle')

%Zone 3
figure
zInds = find(round(s.var_graph,4) == .948);
zInds = zInds:find(round(s.var_graph,4) == .99);
subplot(2,2,1)
mgd = s.res{1}.param(1)*s.res{1}.param(10)*s.distance;
mgda = sa.res{1}.param(1)*sa.res{1}.param(10)*sa.distance;
plot(s.var_graph(zInds),s.cost_graph(zInds).*mgd(zInds)); hold on; 
plot(sa.var_graph(zInds), sa.cost_graph(zInds) .* mgda(zInds));
xlabel('Apex Height'); ylabel('Energy [J]'); title('Energy Dissipated')
legend('No Ankle','Ankle')

subplot(2,2,2)
plot(s.var_graph(zInds), s.distance(zInds)); hold on;
plot(sa.var_graph(zInds), sa.distance(zInds));
xlabel('Apex Height'); ylabel('Distance [m]'); title('Distance traveled by SLIP')
legend('No Ankle','Ankle')

subplot(2,2,3)
plot(s.var_graph(zInds), s.rInitial(zInds)); hold on;
plot(sa.var_graph(zInds), sa.rInitial(zInds));
xlabel('Apex Height'); ylabel('Length [m]'); title('Leg length on touchdown')
legend('No Ankle','Ankle')

subplot(2,2,4)
plot(s.var_graph(zInds), s.yInitial(zInds)); hold on;
plot(sa.var_graph(zInds), sa.yInitial(zInds));
xlabel('Apex Height'); ylabel('Height [m]'); title('Touchdown height')
legend('No Ankle','Ankle')

%Policy transitions graph
figure;
z1end = .926; z1x = -sqrt(1-z1end^2);
z2end = .948; z2x = -sqrt(1-z2end^2);
z3end = .98;  z3x = -sqrt(1-z3end^2);
t = linspace(0.001,pi-.001);
horLine = plot([-1 1], [0 0]); hold on;
verLine = plot([0 0], [0 1]);
cirLine = plot(cos(t),sin(t));
z2 = fill([0 z1x z2x], [0, z1end z2end],'g','FaceAlpha',.2);
z3 = fill([0 z2x z3x], [0, z2end z3end],'b','FaceAlpha',.2);
tranLine = plot([0 z2x], [0, z2end],'r--','LineWidth',2);
hold on; plot(sa.xInitial(1:250),sa.yInitial(1:250),'k','LineWidth',2)
hold on; plot(s.xInitial(1:248),s.yInitial(1:248),'b','LineWidth',2)
axis equal


