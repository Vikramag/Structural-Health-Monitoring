function [X1,X2] = randomdist()

%Create a vector of 1000 random values drawn from a normal distribution with a mean of b and a standard deviation of a.
a1 = 1;
b1 = 0;
x1 = 5.*randn(1000,1) + b1;
y1 = 5.*randn(1000,1) + b1;
z1 = a1.*randn(1000,1) + b1;
X1 = [x1,y1,z1];  

a2 = 1;
b2 = 40;
x2 = 5.*randn(1000,1) + b2;
y2 = 5.*randn(1000,1) + b2;
z2 = a2.*randn(1000,1) + b2;
X2 = [x2,y2,z2];

end

