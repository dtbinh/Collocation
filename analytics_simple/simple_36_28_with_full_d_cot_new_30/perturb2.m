% MHector
% 7/25/18
% Master script to run a bunch of collocations from

%Let's run over several variable values using previous variable value
%solution as a seed for the next optimization
clear; clc;
tic
% figure
dirComp = getSaveDir('DRL-PC'); %Change if you're running on a different computer

% dirComp = 'C:\Users\mike-\Google Drive\Collocation\damping_highLegE_lowAnkleE';
numOfSaves = 0;
loopSaves = 0;
varNames = {'apex_height'};
varInd = 12;
% ankleNoAnkle = {'_simpleAn*','simpleNoAn*'};
ankleNoAnkle = {'_simpleAn*','_simpleNoA*'};
lowBound = .9;
highBound = 1.1;
passes = 0;
paramSaved = 0;

for varNameNum = 1 %Pick which vars you want to sweet based on varNames
    while xor((loopSaves > 0), (passes == 0))
        loopStartSaves = numOfSaves;
        for ana = 1:2 %Load either ankle or no ankle filenames 1:2
            for lowToHigh1_HighToLow2 = 1:2
                %Get all colls with specified variable and ankle/no ankle
                dirname = strcat(dirComp, '\opt_', varNames{varNameNum}, ankleNoAnkle{ana});
                strucc = dir(dirname);

                %Build arrays of filenames and their paramater values in order of
                %how strucc loads them (inconsistent order)
                for j = 1:numel(strucc)
                    filenameList_temp{j} = strucc(j).name;
                    filename = strucc(j).name;
                    filename = strcat(dirComp, '\', filename);
                    load(filename);
                    param_temp(j) = opt.param(varInd);
                end

                %Sort filenames by their parameter values
                [paramSorted, sortInd] = sort(param_temp);
                lowHighList_temp = filenameList_temp(sortInd);

                %check that filenames have been sorted properly
                for i = 1:length(lowHighList_temp)
                    w = load(strcat(dirComp, '\', lowHighList_temp{i}));
                    [w.opt.param(12), paramSorted(i)];
                end

                %build filename array with respect to lowbounds and highbounds
                ii = 1;
                for i = 1:length(lowHighList_temp)
                    if (paramSorted(i) > lowBound) && (paramSorted(i) < highBound)
                        param(ii) = paramSorted(i);
                        filenameList{ii} = lowHighList_temp{i};
                        ii=ii+1;
                    end
                end

                %Flip if you're sweeping high to low
                if lowToHigh1_HighToLow2 == 2
                    param = fliplr(param);
                    filenameList = fliplr(filenameList);
                end

                %Load first filename and seed
                filename = filenameList{1};
                filename = strcat(dirComp, '\', filename);
                load(filename); prevSeed = opt.X;

                %Sweep
                for sweepInd = 2:length(param)                
                    %Load next opt
                    filename = filenameList{sweepInd};
                    filename = strcat(dirComp, '\', filename);
                    load(filename); originalCost = opt.cost;
                    originalFlag = opt.collParam.flag;
                    originalX = opt.X;

                    %colocate
                    [~, opt] = RUN_COL(prevSeed, opt.param, opt.collParam, opt.seeParam);
%                     opt.param(12)

                    %Save resulting opt if it did better than original and converged or
                    %it converge rather than fail or run out of iterations
                    betterCost = opt.cost < originalCost;
                    valid = sign(opt.collParam.flag) > 0;
                    newValid = sign(opt.collParam.flag) > sign(originalFlag);
                    if (valid && betterCost) || newValid
                        save(filename,'opt');
                        numOfSaves = numOfSaves+1;
                        paramSaved(end+1) = opt.param(12); 
                        %Set current seed to prevSeed for next collocation
                        prevSeed = opt.X;
                        %Maybe save the indicies of the params that were
                        %improved to come back later and test?
                    else
                        %Don't save anything
                        %Set current seed to prevSeed for next collocation
                        prevSeed = originalX;
                    end


                    prevSeed = opt.X;
                end           
            end
        end
        loopSaves = numOfSaves - loopStartSaves;
    end
end

numOfSaves
toc
load handel;
player = audioplayer(y, Fs);
play(player);