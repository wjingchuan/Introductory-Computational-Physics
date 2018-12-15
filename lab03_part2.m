% **************************************************************
% This programs demonstrates substractive cancelation
%
% Your Name
% PHYS 234
% Department of Physics
% University of Alberta
% Edmonton, Alberta, CANADA
% Junk here, remove me, but change to today's date
% **************************************************************

% this program computes freefall motion
% t=time, v0=starting velocity, v1=final velocity, x=distance dropped
v0 = 1.0;
g = 9.8;  % gravitational accelration in m/(s^2)
fprintf("choose one of the following:\n");
fprintf("1. compute final velocity\n");
fprintf("2. compute distance traveled\n");
opt = input('enter:');
iter = 1;
while iter <= 10
    t = input('enter t value:');
    if(opt==1 || opt==2)
        if(opt==1)
            v1 = v0 + g * t;
            fprintf("The final velocity = %f\n", v1);
        end
        if(opt==2)
            x = v0 * t + g * t^2 / 2.0;
            fprintf("The distance traveled = %f\n", x);
        end
    else
        fprintf("No soup for you!\n");
    end
    iter = iter + 1;
end