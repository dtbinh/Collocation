function f_eval = stanceDyn(DV,param)
%DYNAparam.mparam.i_motorCS
%    F = DYNAparam.mparam.i_motorCS(param.DV,param.i_motorN2,K,param.m,G,param.i_motor,param.transmission)

%    param.transmissionhis function was param.generated by the Symbolic param.math param.transmissionoolbox version 7.1.
%    10-Auparam.g-2018 11:48:22


%DV = [x, y, r0, dx, dy, dr0, tleg, tankle, Tstance]
%Dynamics

x = DV(1);
y = DV(2);
r0 = DV(3);
dx = DV(4);
dy = DV(5);
dr0 = DV(6); 
Tleg = DV(7);
Tankle = DV(8);
t2 = x.^2;
t3 = y.^2;
t4 = t2+t3;
t5 = 1.0./sqrt(t4);
dyn = [param.k.*x-param.k.*x.*r0.*t5; param.m.*param.g+param.k.*y-param.k.*y.*r0.*t5; param.k.*(r0.*2.0-sqrt(t4).*2.0).*(1.0./2.0)];

% Virtual work
Q = [-(Tankle * param.transmission_ankle + param.disturbance_f) * y/t4; (Tankle * param.transmission_ankle + param.disturbance_f) * x/t4; Tleg * param.transmission]; %Was weird, fixed 10.9
dD = param.c* [-dr0 * x/sqrt(t4) + (dx*x^2 + x*dy*y)/t4; -dr0 * y/sqrt(t4) + (dy*y^2+dx*x*y)/t4; dr0 - (dx*x+dy*y)/sqrt(t4)]; %Tiny error 10.8.18 y dyn were  -dr0 * y/sqrt(t4) + (dy*y^2+dx*dx*y)/t4
% Q = [0; 0; 0];
% dD = [0; 0; 0];
%mass matrix
m = reshape([param.m,0.0,0.0,0.0,param.m,0.0,0.0,0.0,param.i_motor.*param.transmission.^2],[3,3]);
qdd = m \ (Q - dD - dyn);
f_eval = [dx; dy; dr0; qdd];