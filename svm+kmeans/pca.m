function [U, S] = pca(X)
%% PCA Run principal component analysis on the dataset X
%[U, S, X] = pca(X) computes eigenvectors of the covariance matrix of X

[m, n] = size(X);
U = zeros(n);
S = zeros(n);
covariance = (1/m)*X'*X;
[U, S, V] = svd(covariance)

end
