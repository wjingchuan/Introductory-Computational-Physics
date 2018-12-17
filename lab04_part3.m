% ******************************************************************
% program to compute the area under a trapezoid using a function
% ******************************************************************
% Jingchuan
% PHYS 234
% Department of Physics
% University of Alberta
% Edmonton, Alberta, Canada
% Dec 16, 2018
% *****************************************************************/

t0 = input('enter time range t0:\n');
t1 = input('enter time range t1:\n');
dt = input('enter time range dt:\n');
f = input("enter frequency of the wave in Hz:\n");

angle=f*3.1415926*2.0;
fprintf("freq =%g, angle = %g\n", f, angle);

t=t0;

while(t<=t1)
    ft = Calcwave(angle,t);
    fprintf("%g %g\n", t,  ft);
    t = t + dt;
end

function ft = Calcwave(ang, t)
% compute wave amplitude
ang = ang * pi / 180.;
ft = cos(t*ang);
end