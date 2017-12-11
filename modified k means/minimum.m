[X1, X2] = randomdist();
x = X1(:,1);
y= X1(:,2);
z = X1(:,3);
% xx = -1:.05:1;
% yy = abs(sqrt(xx));
% [x,y] = pol2cart(xx,yy);
% k = convhull(x,y);

k = convhull(X1(:,1),X1(:,2),X1(:,3));
plot3(x(k),y(k),z(k),'rs',x,y,z,'b*')
 