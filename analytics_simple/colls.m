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
        function c = sweepLine(c, sweepVarInd, sweepVarList, constVarInd, constVarVal, seed)
            %sweepLine Do a line sweep!
            %One variable will sweep while one variable stays constant. The
            %constant variable must match the seed's initial value
            
            %Double check that the constant variable value is the seed's
            %value
            assert(constVarVal == seed.param(c.grid{constVarInd}));
            
            %Make sweep lists
            upList = sweepVarList(sweepVarList > c.grid{sweepVarInd}.nom);
            downList = fliplr(sweepVarList(sweepVarList < c.grid{sweepVarInd}.nom)); %This one needs to be flipped
            sweepList = {upList, downList};
            
            %Declare opt struct which starts identical to seed
            opt = seed;
            
            numPerturb = 3; %The loop will try 3 times to get a single coll to converge
            for j = 1:2
                list = sweepList{j};
                for i = 1:length(list)
                    %Zero out counters
                    tryCounter = 1;
                    while tryCounter <= numPerturb && opt.collParam.flag <= 0
                        %Set the new sweep parameter (collocation struct
                        %currently is now not optimal - it's slightly perturbed)
                        opt.param(sweepVarInd) = list(i);

                        %Run collocation to fix it
                        opt = runOpt(opt);

                        %Perturb it if it hasn't converged                    
                        if opt.collParam.flag <= 0 && tryCounter < numPerturb
                            opt.X = awgn(opt.X,50);
                            tryCounter = tryCounter + 1;
                        end

                        %Save it if it's good
                        if opt.collParam.flag >= 0
                            uniqueID = string(datetime, 'dMMyHHmmssSSSS');
                            filename = strcat('opt_', uniqueID);
                            save(strcat(c.saveDir,'\',filename),'opt');
                        end %save if good
                    end %while it hasn't converged
                end %for every var change in upList or downList
            end %for both lists in full variable sweep
        end %function
        
        function c = sweepGrid(c)
            %sweepGrid Sweep the full grid
            for anklesOnOff = {'ankle','noAnkle'}
                %Load the nominal point (nominal for both var1 and var2)
                load(anklesOnOff,opt)
                seed = opt; clear opt;
                
                %Make sure the nominal matches the grid nominal
                for i = 1:numel(c.grid)
                    assert(seed.param(c.grid{i}.varInd) == c.grid{i}.nom);
                end
                
                
                %Do a linesweep of var1 with var2 nominal
                c.sweepLine(c.grid{1}.varList, c.grid{2}.nom, seed)
                
            end
        end

        
        function outputArg = loadResults(obj)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            noAnkle = loadResults(c)
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
            g.courseMax = .05;
            listLow = g.min:g.courseMax:g.nom;
            listHigh = g.nom:g.courseMax:g.max;
            g.list = [listLow listHigh(2:end)];
            c.grid{1} = g;
            
            g.varName = 'apex_velocity';
            g.varInd = 13;
            g.nom = 1;
            g.min = .4;
            g.max = 1.5;
            g.courseMax = .05;
            listLow = g.min:g.courseMax:g.nom;
            listHigh = g.nom:g.courseMax:g.max;
            g.list = [listLow listHigh(2:end)];
            c.grid{2} = g;
        end
        
        function c = addAuxProgs(c)
            addpath('C:\Users\DRL-Valkyrie\Google Drive\DRL- Mike Hector\Collocation\analytics_simple\aux_progs');
        end

    end
end
