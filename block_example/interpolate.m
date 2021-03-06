function [t,x,c,f] = interpolate(state,control, p)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%%%
mesh = 10;
% tTemp = linspace(0,p.tEnd,p.N*mesh).';
tk = linspace(0,p.tEnd,p.N).';
hk = mean(diff(tk));
xk = state(1:2,:);
for i =1:length(xk)
    fk(:,i) = Dyn(state(:,i),p);
end
x = [];
t = [];
for i = 1:length(tk)-1
    xTemp = [];
    tTemp = linspace(tk(i),tk(i+1),mesh).';
    tau = tTemp - tk(i);
    for ii = 1:length(tau)
        xTemp(end+1,:) = xk(:,i) + fk(:,i) .* tau(ii) + tau(ii).^2./(2*hk) .* (fk(:,i+1)-fk(:,i));
    end
    if i < length(tk)-1
        t = [t; tTemp(1:end-1)];
        x = [x; xTemp(1:end-1,:)];
    elseif i == length(tk)-1
        t = [t; tTemp(1:end)];
        x = [x; xTemp(1:end,:)];
    end
end

c = interp1(tk, control,t);
f1 = interp1(tk, fk(1,:), t);
f2 = interp1(tk, fk(2,:), t);
f = [f1,f2];
end
