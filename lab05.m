% this code finds the roots of a quadratic
% expression for free fall using quadratic
% convergence Newton=Raphson. The outcome t
% determines whether my car gets damaged.
% Jeff & TAs
% Phys234, lab 5,
% Dec 16, 2018.

global tol nmax tstart coef_a coef_b coef_c
tol = 0.0001;
nmax = 50;
tstart = 8.0;
coef_a = 4.9;
coef_b = 3.35;
coef_c = -28.5;

analytical = quadratic(1);
f = calc_f(analytical);
df = calc_df(analytical);
fprintf("analytical root t=%f, f=%f, df=%f\n", analytical, f, df);
% implements 2nd order Newton-Raphson
[tarray,n2] = calc_newton;
for i=1:n2
    fprintf("i=%d,  t=%f\n", i, tarray(i));
end

function f = calc_f(t)
% calculates function value at t
global coef_a coef_b coef_c
f = coef_a * t^2 + coef_b*t + coef_c;
end

function df = calc_df(t)
% calculates derivative of function value at t
global coef_a coef_b
df = 2.0 * coef_a * t + coef_b;
end

function [xarray, n] = calc_newton
global tol nmax tstart
i = 1;
xarray = zeros(1,nmax);
% computes values for the starting value
t = tstart;
f = calc_f(t);
df = calc_df(t);

while(abs(f) > tol && i < nmax)
    xarray(i) = t;
    fprintf("iteration %d,  f = %f, df = %f, t = %f\n", i, f, df, t);
    i = i + 1;
    t = t - f/df;
    f = calc_f(t);
    df = calc_df(t);
end
n = i - 1;
end

function root = quadratic(opt)
% implements the quadratic formula to find root, analytical
% solution. I am not checking the validity of opt.
global coef_a coef_b coef_c
if(opt==0)
    root = 0.5*(-coef_b-sqrt(coef_b*coef_b-4*coef_a*coef_c))/coef_a;
else
    root = 0.5*(-coef_b+sqrt(coef_b*coef_b-4*coef_a*coef_c))/coef_a;
end
end
