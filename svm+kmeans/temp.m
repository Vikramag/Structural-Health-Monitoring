%% navigator file for SVM

clear; close all;
%% create cloud
[X1, X2] = randomdist();
X1_sigma= trial(X1);
X2_sigma= trial(X2);

%% PCA

[X1] = pc(X1);
[X2] = pc(X2);

%% create a data X for future svm practices
%[X,y] = mergedata(X1,X2);
X = vertcat(X1,X2);
X_sigma = vertcat(X1_sigma,X2_sigma);

%% run k means

initial_centroids = [X1(1,:); X1(2,:)];
%K = 3;
max_iters = 5;

[centroids, idx] = runkMeans(X, initial_centroids, max_iters, true);

y = idx-1;
hold off
%% run k means on 1 sigma

initial_centroids_sigma = [X1_sigma(1,:); X1_sigma(2,:)];
%K = 3;
max_iters = 5;

[centroids_sigma, idx_sigma] = runkMeans(X_sigma, initial_centroids_sigma, max_iters, true);

y_sigma = idx_sigma-1;
hold off
%% plotting data
% figure(2);
% see(X,y)

%% plotting data
figure(3);
see(X_sigma,y_sigma)
%% training data


model = fitcsvm(X,y);


%% draw a plane
figure(3);
plane(X,model)
hold off

%% find distance of mean of clouds from the plane
mean1 = mean(X1);
mean2 = mean(X2);
dis1 = abs(mean1*model.Beta+model.Bias)/(sum(model.Beta'.^2, 2))^0.5;
dis2 = abs(mean2*model.Beta+model.Bias)/(sum(model.Beta'.^2, 2))^0.5;
k1 = (mean1*model.Beta+model.Bias)/sum(model.Beta'.^2, 2);
k2 = (mean2*model.Beta+model.Bias)/sum(model.Beta'.^2, 2);
pt1 = mean1-k1*model.Beta';

sqrt((pt1-mean1)*(pt1-mean1)')
pt2 = mean2-k2*model.Beta';
sqrt((pt2-mean2)*(pt2-mean2)')
%% finding misclassification error
%error1 = misclass(X1,X2,model)

%% calling self made svm algorithm for comparison
figure(4);
modelsvm = svmself(X1,X2);
hold off;

%% comparison of margins of planes obtained from two models
comparison(modelsvm,model);


%% svm of points lying in 1 sigma 



