%function [error] = misclass(X,model)
[X1, X2] = cloud();
temp = zeros(size(X1,1),1);

temp = X*model.Beta+model.Bias;
