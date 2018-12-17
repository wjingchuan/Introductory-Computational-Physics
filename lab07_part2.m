% **********************************************************
% A program to solve dy/dx = -exp(-x)*sin(x)+exp(-x)*cos(x)
% using Euler method. Also practices input and output.
% Jeff Gu
% PHYS 234
% Department of Physics
% University of Alberta
% Edmonton, Alberta, Canada
% Mar 5, 2006
% **********************************************************/

global MAXSTEP
MAXSTEP = 200;

y_an = zeros(1,MAXSTEP);
% initial conditions and parameters
x = input('enter initial x:\n');
dx = input('enter step size dx:\n');
n = input('enter number of steps:\n');
if(n > MAXSTEP)
    fprintf("total steps must be < %d\n", MAXSTEP);
    exit;
end

% compute analytical solutions
y_an = analytic(x, dx, n, y_an);

y = y_an(1);   % set initial function value to analytical solution */
fp = fopen('lab07_part2.out', 'w');
for i = 1:n
    [y,x] = Euler(y,x,dx);
    fprintf(fp, "%f %f %f %f\n", x, y, y_an(i), y-y_an(i));
end
fclose(fp);

function soln = analytic(x, dx, n, soln)
% computes analytical solution to y, save in soln[] */
for i=1:n
    soln(i) = exp(-x) * sin(x);
    x = x + dx;
end
end

function [y,x] = Euler(y, x, dx)
% performs the Euler stepping, and computes numerical solution
y = y + (cos(x) * exp(-x) - sin(x) * exp(-x)) * dx;
x = x + dx;
end
