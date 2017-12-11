%%load('ex7data2.mat');


[X1, X2] = cloud();
X = vertcat(X1,X2);


initial_centroids = [X1(1,:); X1(2,:)];
K = 2;
max_iters = 10;

[centroids, idx] = runkMeans(X, initial_centroids, max_iters, true);