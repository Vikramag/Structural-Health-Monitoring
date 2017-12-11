%% Code for execution of self written algrithm for optimising bias and beta terms of the plane
%  NOTE: the clouds should be completely seperable from each other otherwise algorithm
%  may fail to converge. 
% 


function  [modelsvm] = svmself(X1,X2)

% B = [1 1 -1; 2 1 -1; 1 2 -1; 2 2  -1; -4 -4  1; -4 -5  1; -5 -4  1; -5 -5  1];
% X = B(:,1:2);
% % 
% y = B(:,3);


%% create cloud
%[X1, X2] = cloud();

%% create a data X for future svm practices
[X,y] = mergedata(X1,X2);

%% plot dataa
see(X,y)

%% replace y = 0 with y=-1 as needed in svm algorithm
a = find(y==0);
y(a)=-1;


%% svm algorithm
B = [X y]; 
Bequ = [];
bequ = [];
m = size(B,1);
n = size(B,2);
LB = -inf * ones(n,1);
UB = inf * ones(n,1);
Q = [eye(n-1) zeros(n-1,1); zeros(1,n)];
g=[];
b = -1*ones(m,1);
Wgamma = quadprog(Q,g,B,b,Bequ,bequ,LB,UB);  % this gives us the values of weights ang the bias term
weight = Wgamma(1:end-1);
bias = Wgamma(end);

%% find distance of mean of clouds from the plane
mean1 = mean(X1);
mean2 = mean(X2);
dis1 = abs(mean1*weight+bias)/(sum(weight'.^2, 2))^0.5
dis2 = abs(mean2*weight+bias)/(sum(weight'.^2, 2))^0.5




%% plotting of plane
temp = max(X);
plane_x =temp(1)*[1 -1 -1 1];
plane_z = temp(3)*[2 2 -2 -2];
plane_y =(-Wgamma(4)-plane_x*Wgamma(1)-plane_z*Wgamma(3))/Wgamma(2);
c = [1,1,1,-1];
patch(plane_x,plane_y,plane_z,c)

hold off

modelsvm.Beta = Wgamma(1:end-1);
modelsvm.Bias = Wgamma(end);


