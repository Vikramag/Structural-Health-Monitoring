function ellipse()

[X1, X2] = randomdist();
X_end=sigma1(X1);
plot3(X1(:,1),X1(:,2),X1(:,3),'ro');


covv = diag(cov(X1));
avg= mean(X1);
x= avg(1)-covv(1):0.01:avg(1)+covv(1);
y = 

% msd1=bsxfun(@minus,X1,mean(X1));% mean subtracted data
% 
% temp = zeros(m,n);
% temp2 = zeros(m,1);
% temp = bsxfun(@rdivide,msd1,covv')
% temp2 = diag(temp*temp')
% 
% X_end = X1(find(temp2<4.605),:);



end










