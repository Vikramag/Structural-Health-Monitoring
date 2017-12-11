function X_end = trial(X1)
a= mean(X1);
X1 = bsxfun(@minus,X1,a);
%plot3(X1(:,1),X1(:,2),X1(:,3),'ro');
% a= 15;
% xlim([-a a])  
% ylim([-a a])
% zlim([-a a])
[m , n] = size(X1);
sigm = sqrt(diag(cov(X1)));
for i = 1:n
    Z1(:,i)= X1(:,i)/sigm(i);
end
Y1 = diag(Z1*Z1');
temp = Y1<5;
X1 = bsxfun(@plus,X1,a);
X_end= X1(temp,:);
% hold on
% plot3(X_end(:,1),X_end(:,2),X_end(:,3),'ks');

