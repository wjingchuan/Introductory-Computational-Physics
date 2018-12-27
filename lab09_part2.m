clear;
input = load('lab09.in');
A = input(1:3,:);
d = input(4,:)';
X_leastsq = (A'*A) \ (A'*d);