% ******************************************************************
% program to compute acceleration due to gravity making use of formula
% g=G*m/r^2
% ******************************************************************
% Your name
% PHYS 234
% Department of Physics
% University of Alberta
% Edmonton, Alberta, Canada
% Enter today's date
% *****************************************************************/

G = 6.6742e-11; % the gravitational constant.

% FOR loop over # of planets
for i = 1:1    
    mass = input('Enter mass in kg:\n');
    fprintf("%e\n", mass);
    
    radius = input('Enter radius in meters:\n');
    fprintf("%e\n", radius);
    
    accel = G*mass/((radius*1000)^2);
    fprintf("acceleration is %.2f\n", accel);    
end