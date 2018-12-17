% ******************************************************************
% program to compute the area under a trapezoid using a function
% ******************************************************************
% Your name
% PHYS 234
% Department of Physics
% University of Alberta
% Edmonton, Alberta, Canada
% Enter today's date
% *****************************************************************/

a = input('enter values for top length:\n');
b = input('enter values for bottom length:\n');
h = input('enter values for height:\n');
area = findarea(a,b,h);
fprintf("area under the trapezoid = %f\n", area);

function area = findarea(a,b,h)
area = (a + b) * h / 2;
end