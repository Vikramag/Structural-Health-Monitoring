function see3d(X, y)
%% plots data in 3D and assign color to it according to its label

% to plot X


zeros = find(y==0);
ones = find(y==1);
two = find(y==2);

plot3(X(ones,1),X(ones,2),X(ones,3),'bo');
hold on;
plot3(X(zeros,1),X(zeros,2),X(zeros,3),'rx');
plot3(X(two,1),X(two,2),X(two,3),'cs');