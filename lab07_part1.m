% ******************************************************************
% a program to estimate the finite difference scheme solution of
% free-fall motion.  This is also an exercise for arrays for and
% file input/output.
% ******************************************************************
% Jingchuan
% PHYS 234
% Department of Physics
% University of Alberta
% Edmonton, Alberta, Canada
% Dec 16, 2018
% ******************************************************************

global g dt
g = 9.8;    % grav, acceleration
dt = 0.05;  % time increment

i = 1;  % counter;
t_array = zeros(1,200);
err_array = zeros(1,200);

% initial conditions and parameters
t = 0;    % initial time (sec)
y = 100;  % initial height (m)
v = 0;    % initial velocity
a = -g;

while(y>0)
    [y,v,t] = Euler(y,v,a,t);
    t_array(i) = t;
    y_an = 100 - 0.5 * g * t ^ 2;
    
    err_array(i) = abs(y_an - y) / abs(y_an);
    i = i + 1;
end
t_array = t_array(t_array ~= 0);
err_array = err_array(err_array ~= 0);
f = fopen('lab07_part1.out', 'w');
for i = 1:length(t_array)
    fprintf(f, "%g %g\n", t_array(i),err_array(i));
end
fclose(f);

function [y,v,t] = Euler(y,v,a,t)
global dt
y = y + v * dt;
v = v + a * dt;
t = t + dt;
end
