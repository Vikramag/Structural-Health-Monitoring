A = [1 1;2 1;1 2;2 2;4.5 4;4 4;4 5;5 4;5 5;1.5 2.5];
d = [-1;-1;-1;-1;-1;1;1;1;1;1];
m= size(A,1);
n = size(A,2);

Q = (A*A').*(d*d');
g= -ones(m,1);
Bequ = d';
bequ = 0;
B=[];
b=[];
LB = zeros(m,1);
C = Inf;
[u,gamma,svmind] = svm3(A,d,C);




%function [u]

