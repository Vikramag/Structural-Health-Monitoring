function [u,gamma,svmind] = svm3(A,d,C)

if nargin<3 
    C = Inf; 
end
epsilon = 1e-3;
Q = (A*A').*(d*d');
[m,n]= size(Q);
g=-ones(m,1);
LB = zeros(m,1);
UB = C*ones(m,1);
%u0 = zeros(m,1);
dt = d';
bequ =0;
u = quadprog(Q,g,[],[],dt,bequ,LB,UB);
svind = find(u>epsilon);
nsv = length(svind);
svmind = find((u>epsilon)&(u<(C-epsilon)));
gamma = sum(Q(svmind,svmind)*u(svmind).*d(svmind)-d(svmind))/length(svmind);











