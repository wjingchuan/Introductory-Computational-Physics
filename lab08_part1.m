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
 
% Opens a file called "lab08.in" and write a 20 row, 3 column file.
% In each row, col 1 = x value, col 2 = function y value, col 3 =
% analytical derivative of y.  Use the variables x, y, der (derivative)
% and file pointer above.
% You need to save 20 sets of values for x = 0.6, 1.2, 1.8, 2.4 ...
% Must use pow() function to compute the power of x.  For instructions
% on pow(), use unix manual page by typing "man pow" at $prompt.

fp = fopen('lab08_part1.out', 'w');
x = 0.;
for i = 1:20
    y = 10. + 2.0 * x.^2 + 1.2 * x.^3.0;
    der = 4.0 * x + 1.2 * 3.0 * x.^2;
    fprintf(fp, "%f %f %f\n", x, y, der);
    x = x + 0.6;
end
fclose(fp);