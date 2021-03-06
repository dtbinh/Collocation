function [ cost ] = OBJ_F( DecisionVariables, Parameters, smooth )
%objective_function This function evaluates the objective function
%   This function uses Decision variables and calculates the objective
%   function or cost
    u = DecisionVariables(7:8, :);
    r = sqrt(DecisionVariables(1,:).^2 + DecisionVariables(2,:).^2);
    hk = [DecisionVariables(9,1)/Parameters.Nstance * ones([1,Parameters.Nstance]),...
        DecisionVariables(9,2)/Parameters.Nflight * ones([1,Parameters.Nflight])];
    cost_leg = 0;
    cost_ankle = 0;
    R_leg = Parameters.R_leg;
    R_ankle = Parameters.R_ankle;
    maxXzero = MikeMax(smooth);
    abSmooth = @(x) sqrt(x.^2 + .001.^2) - .001;
    for i = 1:size(DecisionVariables,2)
        cost_leg = cost_leg + ...
            R_leg * u(1, i)^2 * hk(i) +... %electrical
            maxXzero(u(1, i) * Parameters.transmission * DecisionVariables(6, i) * hk(i)); %mechanical
        cost_ankle = cost_ankle + ...
            R_ankle * u(2, i)^2 * hk(i) +... %electrical
            maxXzero(u(2, i) * Parameters.transmission_ankle *...
            (DecisionVariables(1,i) * DecisionVariables(5,i) - DecisionVariables(2,i) * DecisionVariables(4,i)) / (r(i)^2)  * hk(i)); %mechanical
    end
    cost = (cost_leg + cost_ankle);% ...
    %./ (Parameters.m * Parameters.g * abSmooth(DecisionVariables(1,end) - DecisionVariables(1,1))); %COT
end