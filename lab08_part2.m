% ******************************************************************
% A program to compute numerical derivatives for the displacement of
% a moving object.  This little code will generate the function values
% and the analytical solutions of the derivative.
% ******************************************************************
% Jingchuan
% PHYS 234
% Department of Physics
% University of Alberta
% Edmonton, Alberta, Canada
% Dec 16, 2018
% ******************************************************************
clear;
global maxsize
maxsize = 2000;

% variable definitions:
% nrow  --- numver of unknown number of rows of data
% x[maxsize] --- x array with number of elements equal to maxsize
% y[maxsize] --- y array with number of elements equal to maxsize
% der[maxsize] -- analytical derivative of y
% der1[maxsize] -- numerical derivative of y using Newton Backward method
% der2[maxsize] -- numerical derivative of y using Sterling method
% err_newton  -- erorr of Newton Backward derivative scheme
% err_stirling -- error of Sterling's method of derivative

% Implement the function below to open the input file lab08_part1.out and
% save the rows of data into the x, y, and der arrays accordingly.  Then
% report the number of rows read in (nrow).  MUST NOT ASSUME THAT YOU ALREADY
% KNOWS the number of rows, which means you have to use EOF to catch the end
% of file.
input = load('lab08_part1.out');
x = input(:,1);
y = input(:,2);
der = input(:,3);
nrow = length(x);

% task 2---implement a void function called Newton_backward() to compute the
% Newton backward derivative.

der1 = Newton_backward(x, y, nrow);

% task 3---implement a void function called Stirling() to compute derivative
% using Stirling's formula.

der2 = Stirling(x, y, nrow);

% task 4 --- open output files (for writing) called "newton.out" and "stirling.out"
% and save the percentage errors for Newton and Sterling's method (of computing
% derivatives) relative to the analytical derivative at each x locations.  Because
% derivative is not defined for the first and last points of x, you only need nrow-2
% derivatives in each case.
% percentage error = 100.0 * absolute_value ((numerical-analytical)/analytical)

fp1 = fopen('newton.out', 'w');
fp2 = fopen('stirling.out', 'w');

for i = 2:nrow-1
    err_newton = 100. * abs(der(i)-der1(i)) / abs(der(i));
    err_stirling = 100. * abs(der(i)-der2(i)) / abs(der(i));
    fprintf(fp1, "%f %f\n", x(i), err_newton);
    fprintf(fp2, "%f %f\n", x(i), err_stirling);
end
fclose(fp1);
fclose(fp2);

function der1 = Newton_backward(t, y, n)
% computes numerical derivative using Newton Backward.  */

der1 = zeros(n-1,1);
der1(1) = 0.0;
for i = 2:n-1
    der1(i) = (y(i)-y(i-1)) / (t(i)-t(i-1));
end
end

function der2 = Stirling(t, y, n)
% computes numerical derivative using Stirling's formula. */

der2 = zeros(n-1,1);
der2(1) = 0.0;
for i = 2:n-1
    der2(i) = (y(i+1)-y(i-1)) / (t(i+1)-t(i-1));
end
end