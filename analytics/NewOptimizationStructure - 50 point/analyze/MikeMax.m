function [maxZero] = MikeMax(in)
%UNTITLED This passes back a HANDLE which is some kind of max(0,x) function
%   Sometimes smooth, sometimes not

switch in
    case 0
        maxZero = @(q) max(0,q);
        
    case 1
        maxZero = @(q) q .* (atan(.5*q)/pi + .5);

    case 2
        maxZero = @(q) .2*log(1+exp(5*q));
        
    case 3 
        maxZero = @(q) (q + sqrt(q.^2 + .012^2))/2;
        
    otherwise
        pause
        disp('I need an input between 0 and 2');

end

