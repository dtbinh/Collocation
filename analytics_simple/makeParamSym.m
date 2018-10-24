function [dv, PsymStruc, v, Example] = makeParamSym(CollocationParameters, C)
%makeParamSym Make inputs for creating analytical derivatives, comparing
%them

    if C.stanceCollocation == 1
        %Make the decision variable symbols as a long list
        numberOfDV = (2* CollocationParameters.dof +...
            CollocationParameters.cntrl_dof) * (CollocationParameters.N) +1;
        %state+control for whole traj; 
        dv = sym('x', [1 numberOfDV], 'real')'; %all my decision vars (one hop with flight)
    %     x1 = x(1)... x80 = x(80); x81 = y(1)...theta... Tstance, Tflight,
    end

%     %Make the parameters that will be passed as symbols as well
%     syms R_leg R_ankle c m k i_motor transmission lf transmission_ankle g disturbance_f apex_velocity deltav dthetaMax xDist baseline_TDA TD_disturb LockTDA real
%     v = [m c k g i_motor transmission transmission_ankle lf ...
%                 R_leg R_ankle disturbance_f apex_velocity deltav dthetaMax xDist baseline_TDA TD_disturb LockTDA]';
%     v_list = [30 10 2000 10 .00005 80 50 .15 1 1 1 3 3 1 1 3 .5 1.8 .1 1]'; %Example parameter list

    
    [v, v_list] = collParameters(0, C);
    
    %Let Psymparam inheirit properties of CollocationParameters
    PsymStruc = CollocationParameters;
    PsymStrucEX = CollocationParameters;
    %Compile symbolic and example array into struct
    for i=1:length(v)
        PsymStruc.(char(v(i))) = v(i);
        PsymStrucEX.(char(v(i))) = v_list(i);
    end
    
    %Random set of decision vars for checking later
    dv_num_list = rand([length(dv),1]);
%     dv_num_list = [1:length(dv)]';
%     ind = 1:CollocationParameters.N-1:length(dv);
%     dv_num_list(ind) = 1;
    rowNum = 2*CollocationParameters.dof...
            +CollocationParameters.cntrl_dof;
    rowLen = CollocationParameters.N;
    %Build into block
%     for i = 1:CollocationParameters.N-1
%         dv_num_block(:,i) = dv_num_list((i-1) * rowLen+1: (i-1) * rowLen+8);
%     end
%     dv_num_block(end+1,1:2) = [dv_num_list(end-1), dv_num_list(end)];
    %State, control input
    for i = 1:rowNum
        dv_num_block(i,:) = dv_num_list((i-1)*rowLen+1:i*rowLen);
    end
    
    %Add on Tstance
    dv_num_block = [dv_num_block; zeros(size(dv_num_block(1,:)))];
    dv_num_block(end,1) = dv_num_list(end);
    
    Example.dvSym = dv_num_list;
    Example.vSymList = v_list;
    Example.dvNum = dv_num_block;
    Example.vNum = PsymStrucEX;
    
end