function [vect]= normal_vector(X1)

co =cov(X1);
[A,~]=eig(co);
vect =A(:,1);