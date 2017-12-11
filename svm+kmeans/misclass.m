function [error] = misclass(X1,X2,model)
%[X1, X2] = cloud();


temp1 = X1*model.Beta+model.Bias;
temp2 = X2*model.Beta+model.Bias;

misa = find(temp1>=0);
misb = find(temp2<=0);
hold on
plot3(X1(misa,1),X1(misa,2),X1(misa,3),'cs' ,'MarkerSize',10);
plot3(X2(misb,1),X2(misb,2),X2(misb,3),'ks' ,'MarkerSize',10);


hold off

error = (length(misa)+length(misb))/(size(X1,1)+size(X2,2));


