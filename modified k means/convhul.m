clear
close all
%% create cloud
[X1, X2] = randomdist();

%% PCA
% 
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

plot3(X1(:,1),X1(:,2),X1(:,3),'bh')
hold on
xlabel('x')
ylabel('y')
zlabel('z')
bp_index1 = convhull(X1(:,1),X1(:,2),X1(:,3));
plot3(X1(bp_index1(:,1),1),X1(bp_index1(:,1),2),X1(bp_index1(:,1),3),'mh','MarkerSize',10)

% X1_edge = [X1(bp_index1(:,1),1),X1(bp_index1(:,1),2),X1(bp_index1(:,1),3)];
% D1 = pdist2(X1_edge,centroids(1,:)); 








