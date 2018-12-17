% ******************************************************************
% Array exercise
% ******************************************************************
% Jingchuan
% PHYS 234
% Department of Physics
% University of Alberta
% Edmonton, Alberta, Canada
% Dec 16, 2018
% *****************************************************************/

array1 = zeros(1,8);    % array1 should contain 8 numbers input by user
for i = 1:8
    array1(i) = input('enter a random number:\n');
end
array2 = array1( mod(array1,2)~=0 );
nodd = length(array2);

% prints out the odd elements of the original array
for i = 1:nodd
    fprintf("i = %d, element = %d\n", i, array2(i));
end