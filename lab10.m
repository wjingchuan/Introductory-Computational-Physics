clear;
f = @(x) 1./x + exp(1.2.*x);
a = 0.05;
b = 2.0;
% analytical solution
F = @(x) log(x) + exp(1.2.*x) ./ 1.2;
int_analytical = F(b) - F(a);
fp = fopen('lab10.out','w');
fprintf(fp, 'analytic solution     = %f\n', int_analytical);
% Monte Carlo numerical solution
nstep = [10 50 500 5000];
for i = 1:length(nstep)
    int_mc = integral_dx(f,a,b,nstep(i));
    err = 100 * abs(int_mc - int_analytical) / abs(int_analytical);
    fprintf(fp, 'Number of Points in integration = %d\n', nstep(i));
    fprintf(fp, 'Result of numerical integration = %f\n', int_mc);
    fprintf(fp, 'Fractional error of integration = %f\n', err);
    fprintf(fp, '\n');
end

function [integration] = integral_dx( f,a,b,n )
%integrate function (f) using monte carlo method
x = (b-a) .* rand(n,1) + a;
y = f(x);
count = numel(x);
integration = (b-a) ./ count .* sum(y);
end