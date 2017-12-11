function see(X, y)
%% plots data in 3D and assign color to it according to its label

% to plot X


zeros = find(y==0);
ones = find(y==1);
two = find(y==2);

plot(X(ones,1),X(ones,2),'bo');
hold on;
plot(X(zeros,1),X(zeros,2),'rx');
plot(X(two,1),X(two,2),'cs');