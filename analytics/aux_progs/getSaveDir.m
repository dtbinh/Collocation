function [saveDir] = getSaveDir(TypeZeroForListOfInputs)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    if TypeZeroForListOfInputs == 0
        disp('Place -> Input')
        disp('My DRL computer -> DRL-PC')
        disp('My Home computer -> Alluring-PC')
        disp('Michaels DRL computer -> Michael-PC')

    elseif strcmp(TypeZeroForListOfInputs, 'DRL-PC')
        saveDir = 'C:\Users\mike-\Google Drive\Collocation';

    elseif strcmp(TypeZeroForListOfInputs, 'Alluring-PC')
%         saveDir = 'D:\Documents\DRL\slip_opt\opt_results\';
        disp('change me')

    elseif strcmp(TypeZeroForListOfInputs, 'Michael-PC')
%         saveDir = 'C:\Users\carda\OneDrive\Pictures\Documents\mikeHectorThings\slip_opt\opt_results\';
        disp('change me')
    end



end

