function [X_rec] = pc(X)

%[X_norm, mu, sigma] = featureNormalize(X);
[U, ~] = pca(X);
K=2;
Z = projectData(X, U, K);
X_rec  = recoverData(Z, U, K);

end

