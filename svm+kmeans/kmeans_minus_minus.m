%% navigator file for kmeans--

clear
close all
%% create cloud
[X1, X2] = randomdist();

%% PCA

X1 = pc(X1);
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

initial_X = X;              % X and y will change in future processes hence saving it. 
initial_y= y;


hold off
zeroo = find(y==0);


%% swapping of centoids such that centroids(1,:) is centroid of X1 and centroids(2,:) is centroid of X2
% cent = mahal(centroids,X1)
% if cent(1)> cent(2)
%     temp=centroids(1,:) 
%     centroids(1,:)= centroids(2,:);
%     centroids(2,:)= temp;
% %     y(zeroo)=1;
% %     y(oness)=0;
% end



%% plotting data
figure(2);
see(X,y)


%% Kmeans-- algorithm




[X,y,centroids,L1_temp,L2_temp]= kminus(initial_X,initial_y,centroids);
close
L1 = zeros(size(L1_temp));
L2 = zeros(size(L2_temp));
while isequal(L1,L1_temp)==0 && isequal(L2,L2_temp)==0
    L1_temp = L1; 
    L2_temp = L2;
    [X,y,centroids,L1,L2]= kminus(initial_X,initial_y,centroids);
    close
    


end
figure
see(X,y)


% label0 = find(y==0);
% label1 = find(y==1);
% D1 = pdist2(X(label0,:),centroids(1,:));
% D2 = pdist2(X(label1,:),centroids(2,:));
% N =100;                                      % no. of points to be removed
%   
% [X1,X2,y] = top_N(D1,D2,N,X1,X2,y);
% 
% X = vertcat(X1,X2);
% label0 = find(y==0);
% label1 = find(y==1);
% 
% figure
% see(X,y)
% centroid(1,:) =mean(X1);
% centroid(2,:) = mean(X2);













%% training data
% 
% 
% model = fitcsvm(X,y);
% 
% 
% %% draw a plane
% figure(2);
% plane(X,model)
% hold off
% 
% %% find distance of mean of clouds from the plane
% mean1 = mean(X1);
% mean2 = mean(X2);
% dis1 = abs(mean1*model.Beta+model.Bias)/(sum(model.Beta'.^2, 2))^0.5;
% dis2 = abs(mean2*model.Beta+model.Bias)/(sum(model.Beta'.^2, 2))^0.5;
% k1 = (mean1*model.Beta+model.Bias)/sum(model.Beta'.^2, 2);
% k2 = (mean2*model.Beta+model.Bias)/sum(model.Beta'.^2, 2);
% pt1 = mean1-k1*model.Beta'
% 
% sqrt((pt1-mean1)*(pt1-mean1)');
% pt2 = mean2-k2*model.Beta';
% sqrt((pt2-mean2)*(pt2-mean2)');
% %% finding misclassification error
% %error1 = misclass(X1,X2,model)
% 
% %% calling self made svm algorithm for comparison
% % figure(3);
% % modelsvm = svmself(X1,X2);
% % hold off;
% 
% %% comparison of margins of planes obtained from two models
% % comparison(modelsvm,model);
% 
% 
% %% svm of points lying in 1 sigma 
% 


