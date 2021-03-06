function compareSLIP(opt1,opt2)
figure;
store = {opt1,opt2};
p = 1;
col = 6;
stanceEnd = store{1}.collParam.Nstance;
for i = 1:2

    subplot(2,col,p); plot(store{i}.t, store{i}.y);
    title('height over time'); xlabel('time'); ylabel('height');
    p = p+1;

    subplot(2,col,p); plot(store{i}.x, store{i}.y);
    title('height over distance'); xlabel('distance'); ylabel('height');
    p = p+1;
    
    subplot(2,col,p); plot(store{i}.t, store{i}.Tleg);
    title('leg torque over time'); xlabel('time'); ylabel('leg torque');
    p = p+1;

    subplot(2,col,p); plot(store{i}.t, store{i}.Tankle);
    title('ankle torque over time'); xlabel('time'); ylabel('ankle torque');
    p = p+1;
    
    subplot(2,col,p); plot(store{i}.t, store{i}.r0);
    title('r_0 over time'); xlabel('time'); ylabel('r_0');
    p = p+1;
    
    subplot(2,col,p); plot(store{i}.t, store{i}.dr0);
    title('dr_0 over time'); xlabel('time'); ylabel('dr_0');
    p = p+1;
end

get_energy2(opt1,1)
get_energy2(opt2,1)

inds = 1:opt1.collParam.Nstance;
figure;
numplot = 8;

for i = 1:2
    OPT_RES = store{i};
    tend = OPT_RES.t(inds(end));
    subplot(numplot,1,1); hold on; plot(OPT_RES.t(inds)/tend, OPT_RES.x(inds)); title('x');
    subplot(numplot,1,2); hold on; plot(OPT_RES.t(inds)/tend, OPT_RES.y(inds)); title('y');
    subplot(numplot,1,3); hold on; plot(OPT_RES.t(inds)/tend, OPT_RES.dx(inds)); title('dx');
    subplot(numplot,1,4); hold on; plot(OPT_RES.t(inds)/tend, OPT_RES.dy(inds)); title('dy');
    subplot(numplot,1,5); hold on; plot(OPT_RES.t(inds)/tend, OPT_RES.x(inds).*OPT_RES.dy(inds)); title('x times dy');
    subplot(numplot,1,6); hold on; plot(OPT_RES.t(inds)/tend, OPT_RES.y(inds).*OPT_RES.dx(inds)); title('y times dx')
    xyx = (OPT_RES.x(inds).*OPT_RES.dy(inds) - OPT_RES.y(inds).*OPT_RES.dx(inds))./OPT_RES.r(inds);
    subplot(numplot,1,7); hold on; plot(OPT_RES.t(inds)/tend, -xyx); title('XY velocity times unit forward ankle torque')
    subplot(numplot,1,8); hold on; plot(OPT_RES.t(inds)/tend,OPT_RES.Tankle(inds)./OPT_RES.r(inds) *50)
    dr = (OPT_RES.dx .* OPT_RES.x + OPT_RES.dy .* OPT_RES.y)./sqrt(OPT_RES.x.^2 + OPT_RES.y.^2);
    fd{i} = OPT_RES.param(2) * (OPT_RES.dr0 - dr);
    fs{i} = OPT_RES.param(3) * (OPT_RES.r0 - OPT_RES.r);
    fl{i} = fd{i} + fs{i};
    
end
legend('opt1', 'opt2')

eff = (opt2.cost - opt1.cost)/opt2.cost * 100;
disp(['opt1 is ', num2str(eff), '% more efficient than opt2']);


figure; 
for i = 1:2
    o = store{i};
    subplot(2,3,1 +(i-1)*3); plot(o.t(1:stanceEnd), fs{i}(1:stanceEnd)); title('force in spring')
    subplot(2,3,2+(i-1)*3); plot(o.t(1:stanceEnd), fd{i}(1:stanceEnd)); title('force in damper')
    subplot(2,3,3+(i-1)*3); plot(o.t(1:stanceEnd), fl{i}(1:stanceEnd)); title('force in leg')
end



%kinetic and potential energy for each mass
figure
for i = 1:2
    o = store{i};

    stanceEnd = o.collParam.Nstance;
    v = sqrt(o.dx.^2 + o.dy.^2);  
    dr = (o.dx.*o.x + o.dy .* o.y) ./ o.r;
    km{i} = .5 * o.param(1) * v.^2; %Kinetic energy of the COM
    vm{i} = o.param(1) * 9.81 * o.y; %Potenetial energy of the COM
    ki{i} = .5 * o.param(6) * o.param(7)^2 * (o.dr0).^2; %Kinetic energy of the rotor
    
    vs{i} = zeros(size(ki{i}));
    vs{i}(1:stanceEnd) = .5 * o.param(3) * (o.r0(1:stanceEnd) - o.r(1:stanceEnd)).^2;%Potential energy of the spring

    %Integrate over time
    hk = diff(o.t)';
    hk = [hk;hk(end)];
    d{i} = zeros(size(hk));
    d{i}(1:stanceEnd) = cumsum(o.param(2) * (o.dr0(1:stanceEnd) - dr(1:stanceEnd)).^2 .* hk(1:stanceEnd));%Dissipation of the damper
    d{i}(stanceEnd+1:end) = d{i}(stanceEnd);
    lm{i} = cumsum(o.Tleg .* o.param(7) .* o.dr0.*hk); %mechanical energy added by leg
    am{i} = cumsum(o.Tankle .* 50 .*(o.x .* o.dy - o.y .* o.dx) ./ o.r.^2 .* hk); %mechanical energy added by ankle

    sysE{i} = km{i}+ vm{i}+ ki{i}+ vs{i};
    Ein{i} = lm{i} + am{i};
    Eout{i} = d{i};
    hold on;
    plot(o.t, [sysE{i}, Ein{i}, Eout{i}]);
    Fs = o.param(3) * (o.r0(1:stanceEnd) - o.r(1:stanceEnd)) +...
     o.param(2) * (o.dr0(1:stanceEnd) - dr(1:stanceEnd));
 
    %Fact 1
    KE0{i} = km{i}(1) + ki{i}(1) + vs{i}(1);
    KEend{i} = km{i}(end) + ki{i}(end) + vs{i}(end);
end
legend('system energy', 'energy in', 'energy out')

%Energy Facts
%1: Energy at end should equal energy at beginning
%2: Energy in equals energy out
disp('opt1')
disp(['Kinetic energy of beginning = ' num2str(KE0{1}),...
    ' Kinetic energy of end = ' num2str(KEend{1})]);
disp(['Energy in = ' num2str(Ein{1}(end)),...
      ' Energy out = ' num2str(Eout{1}(end))])
disp('opt2')
disp(['Kinetic energy of beginning = ' num2str(KE0{2}),...
    ' Kinetic energy of end = ' num2str(KEend{2})]);
disp(['Energy in = ' num2str(Ein{2}(end)),...
      ' Energy out = ' num2str(Eout{2}(end))])



names = {'x', 'y' 'r0' 'dx' 'dy' 'dr0' 'Tleg' 'Tankle'};
for i = 1:numel(names)
    matcherror(i) = opt1.(names{i})(1) - opt1.(names{i})(end);
end