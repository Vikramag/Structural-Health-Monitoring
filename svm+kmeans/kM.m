function [centroids, idx] = kM(X, initial_centroids, max_iters, true);

[m n]= size(X);
K = size(initial_centroids,1);
idx = zeros(m, 1);
centroids = initial_centroids;

for i= 1:max_iters
    fprintf('K-Means iteration %d/%d...\n', i, max_iters);
    idx = findClosestCentroids(X, centroids);
    centroids = computeCentroids(X, idx, K);
end







end
