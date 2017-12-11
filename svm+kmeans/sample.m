%% navigator file for SVM
close all
clear
%% create cloud
[X1, X2] = randomdist();

%% PCA

[X1] = pc(X1);
[X2] = pc(X2);

%% create a data X for future svm practices
%[X,y] = mergedata(X1,X2);
X = vertcat(X1,X2);

%% run k means

initial_centroids = [X1(1,:); X1(2,:)];
%K = 3;
max_iters = 4;

[centroids, idx] = runkMeans(X, initial_centroids, max_iters, true);

y = idx-1;
hold off
%% plotting data
figure(2);
see(X,y)
xlabel('x')
ylabel('y')
zlabel('z')
%% training data


model = fitcsvm(X,y);


%% draw a plane
figure(2);
plane(X,model)
hold off

%% find distance of mean of clouds from the plane
mean1 = mean(X1);
mean2 = mean(X2);
dis1 = abs(mean1*model.Beta+model.Bias)/(sum(model.Beta'.^2, 2))^0.5;
dis2 = abs(mean2*model.Beta+model.Bias)/(sum(model.Beta'.^2, 2))^0.5;
k1 = (mean1*model.Beta+model.Bias)/sum(model.Beta'.^2, 2);
k2 = (mean2*model.Beta+model.Bias)/sum(model.Beta'.^2, 2);
pt1 = mean1-k1*model.Beta'

sqrt((pt1-mean1)*(pt1-mean1)');
pt2 = mean2-k2*model.Beta';
sqrt((pt2-mean2)*(pt2-mean2)');
%% finding misclassification error
%error1 = misclass(X1,X2,model)

%% calling self made svm algorithm for comparison
figure(3);
modelsvm = svmself(X1,X2);
hold off;

%% comparison of margins of planes obtained from two models
comparison(modelsvm,model);


%% angles between planes
vect1 = normal_vector(X1);
vect2 = normal_vector(X2);
vect3 = modelsvm.Beta;
vect1'*vect3
A1 = acos(vect1'*vect3/sqrt((abs(vect1'*vect1)*abs(vect3'*vect3))));
A2 = acos(vect2'*vect3/sqrt((abs(vect2'*vect2)*abs(vect3'*vect3))));





