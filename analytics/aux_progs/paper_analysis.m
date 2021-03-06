%MHector
%8.20.18
%Ankle questions

%% Test 1
%What is the total energy cost of adding 1 J of mechanical ankle energy
%throughout stance vs. 1 J of mechanical leg energy
clc; clear; close all;
load('seedC'); R = opt; clear opt_results;
hk = R.Tstance / R.collParam.N;
W_tot_leg = 1 + R.param(R.collParam.modelParamList == 'R_leg') ./ ((R.param(R.collParam.modelParamList == 'transmission') .* R.dr0).^2 * hk);
W_tot_leg = W_tot_leg(1:R.collParam.Nstance);
W_tot_ankle = 1 + R.param(R.collParam.modelParamList == 'R_ankle') .* R.r.^4 ./...
    ((R.param(R.collParam.modelParamList == 'transmission_ankle') .* (R.x .* R.dy - R.y .* R.dx)).^2 .* hk);
W_tot_ankle = W_tot_ankle(1:R.collParam.Nstance);
figure; plot(R.tstance, W_tot_leg); hold on; plot(R.tstance, W_tot_ankle);
legend('Leg energy', 'Ankle energy'); title('Energy required to add 1 J of mechanical energy to the system throughout stance');
xlabel('Time'); ylabel('Energy')
ankleEasy = W_tot_ankle < W_tot_leg;
disp(['It is easier to add energy through ankle during ',...
    num2str(sum(ankleEasy)/length(ankleEasy) * 100), ' % of stance']) 
% Looks like it's always easier to pump in some energy via ankle rather
% than leg. Whether that energy contributes to anything useful is yet to be
% determined

%% Test 2
%What is the range of feasible COPs throughout stance?
clc; clear; close all;
load('baseline6'); R = opt_results; clear opt_results;
TAnkleMax = 4.5 * 50;
xcopMax = abs(-TAnkleMax .* R.r./(R.param.k .* (R.r0 - R.r) .* R.y));
for i = 1:length(xcopMax)
    if xcopMax(i) > R.param.lf/2
        xcopMax(i) = R.param.lf/2;
    end
end
Tmax = abs(-R.param.lf/2 .* (R.param.k .* (R.r0 - R.r)) .* R.y./R.r);
Forcemax = Tmax .* R.r;
GRFy = R.param.k * (R.r0 - R.r);
prop = GRFy./Forcemax;
figure; plot(R.t, prop)

        
        
        
        