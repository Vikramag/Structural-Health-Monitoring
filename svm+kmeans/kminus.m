function [X_,y_,centroid_,L1,L2]= kminus(X,y,centroids)

label0 = find(y==0);
label1 = find(y==1);
X1 = X(label0,:);
X2 = X(label1,:);

D1 = pdist2(X1,centroids(1,:));     % finding the distance of all points in X1 wrt its centroid
D2 = pdist2(X2,centroids(2,:));     % finding the distance of all points in X2 wrt its centroid
N =100;                             % no. of points to be removed
  
[X1,X2,y_,L1,L2] = top_N(D1,D2,N,X1,X2,y);  % this file removes top N most distant points from each cluster
                                                                

X_ = vertcat(X1,X2);
label0 = find(y==0);
label1 = find(y==1);

figure
see(X_,y_)
centroid_(1,:) =mean(X1);
centroid_(2,:) = mean(X2);





end