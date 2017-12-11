function [X,y] = mergedata(X1,X2)
%% this function merge 2 datas vertically i.e one below the other and also assigns labels to clouds.
m1 = size(X1,1);
m2 = size(X2,1);
y1 = zeros(m1,1);
y2 = ones(m2,1);
X = vertcat(X1,X2);
y= vertcat (y1,y2);