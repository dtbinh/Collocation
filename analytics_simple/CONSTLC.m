function [ c, ceq] = CONSTLC( dv, Parameters )
%nonlcon This function determines the violation of the constraints
%   Using trapezoidal collocation, the violation of the constraints is
%   determined by plugging in the decision variables into formulated
%   dynamics such that we expect 0. The difference from that and 0 is our
%   violation

%     if size(dv,2) < 2
%         dvSymList2Block(dv,)
% 
%     if ~isfield(Parameters, 'm') %If it is not a structure
%         %Turn it into a struc
%         Parameters = paramSymList2Struc(Parameters);
%     end

    %Stance collocation constraints
    eqStance = stanceConstraints(dv, Parameters);
    
    %Flight collocation constraints
    eqFlight = flightConstraints(dv, Parameters);
    
    %Concatenate and reshape collocation constraints
    ceqColl = [eqStance, eqFlight];
    ceq = reshape(ceqColl, [size(ceqColl,1)*size(ceqColl,2),1]);
    
    %Names
    stanceEnd = Parameters.Nstance;
    x = dv(1,:);
    y = dv(2,:);
    r0 = dv(3,:);
    dx = dv(4,:);
    dy = dv(5,:);
    dr0 = dv(6,:);
    ddr0 = dv(7,:);
    Tankle = dv(8,:);
    Tstance = dv(9,1);
    r = sqrt(x.^2 + y.^2);
    dr = (x.*dx + y.*dy)/sqrt(x.^2+y.^2);
%     apex_height = dv(9,3);
    
%     eqCon = zeros(9,2);  

    %Starting stance constraints
    %Fs starts at 0
    Fs = Parameters.k * (r0 - r) + Parameters.c * (dr0 - dr);
    eqCon = Fs(1);
    %y - velocity + position. energy approach
    eqCon(end+1) = .5 * dy(1)^2 - Parameters.g * (Parameters.apex_height - y(1));
    %x - velocity
    eqCon(end+1) = dx(1) - Parameters.apex_velocity;
    
    %Ending stance constraints
    %Force in spring is 0
    eqCon(end+1) = Fs(stanceEnd);
    %Liftoff energy
    eqCon(end+1) = Parameters.g * (Parameters.apex_height - y(stanceEnd)) - .5 * dy(stanceEnd)^2;
    %Apex velocity x
    eqCon(end+1) = dx(stanceEnd) - (Parameters.apex_velocity + Parameters.deltav);

    %Transition Constraints
    %State at end of stance matches state at start of flight
%     eqCon(4:6,2) = dv(4:6,stanceEnd) - dv(4:6, stanceEnd+1);
    
    %Ending flight constraints - match initial stance translated in x
%     eqCon(1:6,2) = dv(2:7,end) - dv(2:7,1);
%     eqCon(3,1) = dv(8,end) - dv(8,1);
    
    %Just for apex apex velocities
    %Ending flight constraints - match initial stance translated in x
    inds = [2:3, 5:8];  %Also not x dot
    eqCon = [eqCon, [dv(inds,end) - dv(inds,1)]'];

%%%%%%%%%%%TURNED OFF TO IMPLEMENT IN APEX TO APEX VELOCITIES%%%%%%%%%%%
    %Average velocity
    disp('THIS WILL BE APEX TO APEX - NOT AVERAGE VELOCITY')
%     eqCon(3,1) = Parameters.average_velocity - (x(end) - x(1)) / (dv(9,1) + dv(9,2));
%%%%%%%%%%%TURNED OFF TO IMPLEMENT IN APEX TO APEX VELOCITIES%%%%%%%%%%%

    %Apex to apex velocities - I know these are linear constraints, get off
    %my back, Janice
%     eqCon(1,3) = dx(1) - Parameters.apex_velocity;
%     eqCon(2,3) = dx(stanceEnd) - (Parameters.apex_velocity + Parameters.deltav);

    %Distance to travel - linear inequality
%     eqCon(4,1) = Parameters.xDist - (x(end) - x(1));

    %Theta stuff
    %Flight ends at TD angle
    eqCon(end+1) = theta(end) - atan2(y(1), x(1));
    %Flight starts at LO angle
    eqCon(end+1) = theta(1) - atan2(y(stanceEnd), x(stanceEnd));
    
%     %Lock the TD angle
    eqCon(end+1) = Parameters.LockTDA .*...
    (atan2(y(1),x(1)) - (Parameters.baseline_TDA + Parameters.TD_disturb));

    eqCon = reshape(eqCon, [numel(eqCon),1]);
    %Concatenate collocation constraints and other constraints
    ceq = [ceq; eqCon];

    %Inequality constraints
    %Ankle torque bounds
    ankle_bound = (Parameters.lf .* y(1:stanceEnd) .* ...
                   Parameters.k .* (r0(1:stanceEnd) - r(1:stanceEnd)))...
                   ./ (2 .* r(1:stanceEnd));
               
    Acon1 = Tankle(1:stanceEnd) * Parameters.transmission_ankle - ankle_bound;
    Acon2 = -(Tankle(1:stanceEnd) * Parameters.transmission_ankle + ankle_bound);
    
    %Minimum Distance traveled
%     minX = Parameters.minDistance - (x(end) - x(1));
    
    %Theta constraints
    %Angle velocity constraint
    dTFlight = dv(9,2)/Parameters.Nflight;
    for i = 1: numel(theta)-1
        diffTheta(i) = theta(i+1) - theta(i);
    end
    dTheta = diffTheta/dTFlight;
    dThetaConPos = dTheta - Parameters.dthetaMax;
    dThetaConNeg = -(dTheta + Parameters.dthetaMax);
    
    
    %Foot height constraints
    footHeight = -(y(stanceEnd+1:end) - r0(stanceEnd+1:end) .* sin(theta(2:end)));
    
    c = [Acon1'; Acon2'; dThetaConPos'; dThetaConNeg'; footHeight']; %minX
    
    %Reshape
    c = reshape(c, [size(c,1)*size(c,2),1]);
    
end
