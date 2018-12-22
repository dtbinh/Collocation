classdef colls
    %colls Runs, saves, and perturbs optimization structures for SLIP
    %running
    %   Detailed explanation goes here
    
    properties
        noAnkle
        ankle
        saveDir
        grid        
    end
    
    methods
        function c = initialize(c)
           %Initialize Builds grid, loads save directory, adds aux progs to
           %path
            c = c.gridSet;
            c = c.getSaveDir;
            c = c.addAuxProgs;
            c = c.loadSaves;
        end
        
        function c = sweepLine(c, gridSweepInd, sweepVarList, gridConstInd, constVarVal, seed)
            %sweepLine Do a line sweep!
            %One variable will sweep while one variable stays constant. The
            %constant variable must match the seed's initial value
            
            %Double check that the constant variable value is the seed's
            %value
            assert(constVarVal == seed.param(c.grid{gridConstInd}.varInd));
            
            %Make sweep lists
            upList = sweepVarList(sweepVarList > c.grid{gridSweepInd}.nom);
            downList = fliplr(sweepVarList(sweepVarList < c.grid{gridSweepInd}.nom)); %This one needs to be flipped
            sweepList = {upList, downList};
            
            %Declare opt struct which starts identical to seed
            opt = seed;
            opt.collParam.flag = 0; %Little hack to get the loop to start
            
            numPerturb = 3; %The loop will try 3 times to get a single coll to converge
            for j = 1:2
                list = sweepList{j};
                for i = 1:length(list)
                    %Zero out counters
                    tryCounter = 1;
                    while tryCounter <= numPerturb && opt.collParam.flag <= 0
                        %Set the new sweep parameter (collocation struct
                        %currently is now not optimal - it's slightly perturbed)
                        [opt.param(c.grid{gridSweepInd}.varInd), list(i)]
                        opt.param(c.grid{gridSweepInd}.varInd) = list(i);

                        
                        %Run collocation to fix it
                        opt = runOpt(opt);
                        
                        tryCounter = tryCounter + 1;
                        %Perturb it if it hasn't converged                    
                        if opt.collParam.flag <= 0 && tryCounter <= numPerturb
                            opt.X = awgn(opt.X,50);
                        end

                        %Save it if it's good
                        if opt.collParam.flag > 0
                            uniqueID = string(datetime, 'dMMyHHmmssSSSS');
                            if opt.collParam.ankles_on == 1
                                ankleTag = 'ankle_';
                            elseif opt.collParam.ankles_on == 0
                                ankleTag = 'noAnkle_';
                            end
                            filename = strcat('opt_', ankleTag, uniqueID);
                            save(strcat(c.saveDir,'\',filename),'opt');
                        end %save if good
                    end %while it hasn't converged
                    opt.collParam.flag = 0; %To make the loop start
                end %for every var change in upList or downList
                opt = seed; %Bring the seed back to nominal value
                opt.collParam.flag = 0; %To make the loop start
            end %for both lists in full variable sweep
        end %function
        
        function c = sweepInitialGrid(c)
            %sweepGrid Sweep the full grid
            %Get the save directory
            c = c.getSaveDir;
            
            ankleTag = {'ankle','noAnkle'};
            for anklesOnOff = [1,2]
                %Load the nominal point (nominal for both var1 and var2)
                assert(isfile(strcat(ankleTag{anklesOnOff},'.mat')),'Make sure that the nominal files (ankle.mat, noAnkle.mat are in current dir')
                load(ankleTag{anklesOnOff},'opt')
                seed = opt; 
                
                %Make sure the nominal matches the grid nominal
                for i = 1:numel(c.grid)
                    assert(seed.param(c.grid{i}.varInd) == c.grid{i}.nom);
                end
                
                %Copy the nominal to save dir
                uniqueID = string(datetime, 'dMMyHHmmssSSSS');
                filename = strcat('opt_', ankleTag{anklesOnOff}, '_', uniqueID);
                save(strcat(c.saveDir,'\',filename),'opt');
                
                clear opt;
                
                %Do a linesweep of var1 with var2 nominal - these will be
                %the nominal seeds from which the rest of the grid will be
                %built
                c.sweepLine(1, c.grid{1}.list, 2, c.grid{2}.nom, seed)
                
                %Do a linesweep of var2 for each var1 starting at nominal
                for var1 = c.grid{1}.list
                    %Find the seed (whatever var1 value, nominal var2)
                    seed = c.findColl(var1, c.grid{2}.nom, ankleTag{anklesOnOff});
                    c.sweepLine(2, c.grid{2}.list, 1, var1, seed);
                end
            end
        end

        function seed = findColl(c, var1, var2, ankleSwitch)
            %findColl Finds collocation file given var1 and var2 values
            %Takes var1 and var2 scalars, ankleOn 1 or 0, returns opt struct
            c = loadSaves(c);
            sigFig = 6; %The number of digits to round to and match
            
            %Load ankle or no ankle depending on ankle input
            
            if strcmp('noAnkle',ankleSwitch)
                s = c.noAnkle;
            elseif strcmp('ankle',ankleSwitch)
                s = c.ankle;
            else
                s = []; disp('No opts loaded to colls, check input to findColl');
            end
            
            %Check to make sure something was loaded
            if numel(s) > 0
                %sweep through to find the opt we want
                seed = []; sweepI = 1; seedsFound = 0;%initialize
                while numel(seed) == 0 && sweepI <= numel(s.res)
                    %Note the vars for this opt
                    var1_temp = round(s.res{sweepI}.param(c.grid{1}.varInd),sigFig);
                    var2_temp = round(s.res{sweepI}.param(c.grid{2}.varInd),sigFig);

                    %Save it if it's the right one
                    if var1_temp == round(var1,sigFig) && var2_temp == round(var2,sigFig)
                        seed = s.res{sweepI};
                        seedsFound = seedsFound +1;
                    end
                    sweepI = sweepI + 1; %Increment
                end
                assert(seedsFound > 0, 'Opt with those vars not found')
                assert(seedsFound <= 1, 'Multiple opts with those vars were found')
            else
                disp(['Nothing found at ',ankleSwitch, ' class property']);
                seed = [];
            end
        end

        function c = loadSaves(c)
            %loadSaves Load saved coll files in current save directory
            %Updates the ankle and noAnkle properties, sorts by var1                
            for ankleSwitch = [0 1]
                %Decide which files to call
                if ankleSwitch == 1
                    dirname = strcat(c.saveDir, '\opt_ankle*');
                elseif ankleSwitch == 0
                    dirname = strcat(c.saveDir, '\opt_noAnkle*');
                end

                %Look for coll files by that name
                strucc = dir(dirname);
                
                %Check to make sure something was actually loaded
                if numel(strucc) ~= 0
                    %load in optimization structs, noting var1 value
                    for i = 1:length(strucc)
                        filename = strucc(i).name;
                        filename = strcat(c.saveDir, '\', filename);
                        load(filename)
                        opt.filename = filename;
                        results{i} = opt;
                        varr(i) = opt.param(c.grid{1}.varInd); %list var1, we'll sort by this later

                        if round(varr(i),5) == .98
                            1+1;
                            varr(i);
                        end
                    end
                    [var_sorted,i] = sort(varr); %sort by var1

                    q=1;
                    for k = 1:length(i)
                        results_sorted_var{k} = results{i(k)};
                        flags(k) = results{i(k)}.collParam.flag;
                        if results{i(k)}.collParam.flag > 0
                            res{q} = results_sorted_var{k};
                            full = stance2Full(results{i(k)});
                            s.var1(q) = results{i(k)}.param(c.grid{1}.varInd);
                            s.var2(q) = results{i(k)}.param(c.grid{2}.varInd);
                            s.cost(q) = results{i(k)}.cost;
                            s.rInitial(q) = results{i(k)}.r(1);
                            s.rFinal(q) = results{i(k)}.r(end);
                            s.yInitial(q) = results{i(k)}.y(1);
                            s.yFinal(q) = results{i(k)}.y(end);
                            s.xInitial(q) = results{i(k)}.x(1);
                            s.xFinal(q) = results{i(k)}.x(end);
                            s.dyInitial(q) = results{i(k)}.dy(1);
                            s.dyFinal(q) = results{i(k)}.dy(end);
                            s.fDamperFinal(q) = results{i(k)}.param(2)*(results{i(k)}.dr0(end) -results{i(k)}.dr(end));
                            s.fSpringFinal(q) = results{i(k)}.param(3)*(results{i(k)}.r0(end) -results{i(k)}.r(end));
                            s.tdA(q) = atan2(results{i(k)}.y(1),results{i(k)}.x(1));
                            flightTime = full.apexToGroundTime + full.groundToApexTime;
                            s.groundedRunMeasure(q) = flightTime/results{i(k)}.Tstance; %Flight Time / Stance Time
                            s.peakGRF(q) = max(results{i(k)}.Fleg);
                            energy = get_energy3(results{i(k)});
                            s.eLegMech(q) = energy.leg_m;
                            s.eAnkleMech(q) = energy.ankle_m;
                            s.damper(q) = energy.damper;
                            s.deltaRtdLO(q) = results{i(k)}.r(end) - results{i(k)}.r(1);
                            s.deltaR0tdLO(q) = results{i(k)}.r0(end) - results{i(k)}.r0(1);
                            s.maxPush(q) = max(results{i(k)}.r0) - min(results{i(k)}.r0);
                            s.tdCentripedalVel(q) = (results{i(k)}.dx(1).*results{i(k)}.y(1) - results{i(k)}.dy(1) .* results{i(k)}.x(1))./ results{i(k)}.r(1);
                            s.tdCentripedalF(q) = results{i(k)}.param(1).*s.tdCentripedalVel(q).^2./results{i(k)}.r(1);        
                            xFlight = results{i(k)}.param(13) * (results{i(k)}.dy(end) - results{i(k)}.dy(1))/ results{i(k)}.param(10);
                            s.distance(q) = xFlight + results{i(k)}.x(end) - results{i(k)}.x(1);
                            costEst = (energy.leg_m + energy.ankle_m + energy.ringDamp) ./ s.distance(q);
                            s.filename{q} = results{i(k)}.filename;
                            q = q+1;
                        end
                    end
                    s.res = res;
                    s.varInd = c.grid{1}.varInd;

                    %update class property
                    if ankleSwitch == 0
                        c.noAnkle = s;
                    elseif ankleSwitch == 1
                        c.ankle = s;
                    end
                else
                    disp(['Nothing found at ', dirname])
                end %if there's something to load
            end %For ankle or noAnkle
        end 
        
        function c = gridCheck(c)
            %checkGrid If grid does not match desired courseness, add
            %points
        end
        
        function c = gridSet(c)
            %setGrid setup grid structure
            g.varName = 'apex_height';
            g.varInd = 12;
            g.nom = 1;
            g.min = .7;
            g.max = 1.2;
            g.courseMax = .3;
            listLow = linspace(g.min,g.nom,ceil((g.nom-g.min)/g.courseMax)+1);
            listHigh = linspace(g.nom,g.max,ceil((g.nom-g.min)/g.courseMax)+1);
            g.list = [listLow listHigh(2:end)];
            c.grid{1} = g;
            
            g.varName = 'apex_velocity';
            g.varInd = 13;
            g.nom = 1;
            g.min = .4;
            g.max = 1.5;
            g.courseMax = .3;
            listLow = linspace(g.min,g.nom,ceil((g.nom-g.min)/g.courseMax)+1);
            listHigh = linspace(g.nom,g.max,ceil((g.nom-g.min)/g.courseMax)+1);
            g.list = [listLow listHigh(2:end)];
            c.grid{2} = g;
        end
        
        function c = addAuxProgs(c)
            addpath('C:\Users\DRL-Valkyrie\Google Drive\DRL- Mike Hector\Collocation\analytics_simple\aux_progs');
        end

        function c = getSaveDir(c)
            c.saveDir = 'C:\Users\DRL-Valkyrie\Google Drive\CollocationResults\absIntFVobj_sweep_apex_height_vel';
        end
    end
end
