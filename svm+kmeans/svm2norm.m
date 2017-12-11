function [u,gamma,svind] = svm2(A,d,C)

if nargin<3 
    C = Inf; 
end
epsilon = 1e-3;
Q = (A*A').*(d*d');
[m,n]= size(Q);
g=-ones(m,1);
LB
Q = (A*A' + IbyC).*(d*d');
f = -ones(m,1);
vlb = zeros(m,1);
vub = Inf*ones(m,1);
u0 = zeros(m,1);
dt=d';
bequ =0;
u = quadprog(Q,f,[],[],dt,bequ,vlb,vub,u0);

svind = find(u>epsilon);
nsv = length(svind);
svind = find((u>epsilon)&(u<(C-epsilon)));
gamma = sum(Q(svind,svind)*u(svind).*d(svind)-d(svind))/length(svind);



