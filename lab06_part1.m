% ******************************************************************
% Program to compute the numerical integration of a function
% using the Extended Trapezoid Rule.
% ******************************************************************
% Jingchuan
% PHYS 234
% Department of Physics
% University of Alberta
% Edmonton, Alberta, Canada
% Dec 16, 2018
% *****************************************************************/

global coef_a coef_b decay xmin xmax
coef_a = 0.2;   % coefficient "a" in the introduction */
coef_b = 1.0;   % coefficient "b" in the introduction */
decay = 2.0;    % the decay constant in the troduction */
xmin = 0.5;     % lower limit of integration */
xmax = 10.0;    % upper limit of integration */

npt = input('enter the total points for integration:\n');
sum_an = calc_analytic(xmin, xmax);
fprintf("analytical solution = %f\n", sum_an);
h = (xmax - xmin) / (npt - 1);   % finds the x increment "h"
x = xmin;
sum = 0.;
% Implement the Extended Trapezoidal rule 
for i = 1:npt
    f = calc_f(x);
    if i == 1 || i == npt
        sum = sum + 0.5 * f * h;
    else
        sum = sum + f * h;
    end
    x = x + h;
end
fprintf("Numerical integration = %f\n", sum);
fprintf("h = %f,  error = %f\n", h, abs(sum-sum_an));

function f = calc_f(x)
global coef_a coef_b decay
f = coef_a * exp(-decay*x) + coef_b * x ^ 2;
end

function f = calc_analytic(xlow, xhigh)
global coef_a coef_b decay
sum0 = coef_a * (-0.5) * exp(-decay*xlow) + coef_b * xlow ^ 3 / 3.0;
sum1 = coef_a * (-0.5) * exp(-decay*xhigh) + coef_b * xhigh ^ 3 / 3.0;
f = sum1 - sum0;
end
