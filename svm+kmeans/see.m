function see(X, y)
%% plots data in 3D and assign color to it according to its label

% to plot X

ones = find(y==1);
zeros = find(y==0);

plot3(X(ones,1),X(ones,2),X(ones,3),'rx');
hold on;
plot3(X(zeros,1),X(zeros,2),X(zeros,3),'bo');
