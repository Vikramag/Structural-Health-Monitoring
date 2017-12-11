function plane(X,model)
%% draws plane from bias and beta values given in model(input)



%draw the line 
temp = max(X);
plane_x =temp(1)*[1 -1 -1 1];
plane_z = temp(3)*[2 2 -2 -2];
plane_y =(-model.Bias-plane_x*model.Beta(1)-plane_z*model.Beta(3))/model.Beta(2);
c = [1,1,1,-1];
patch(plane_x,plane_y,plane_z,c)


% x = [1 -1 -1 1]; % Generate data for x vertices
% y = [1 1 -1 -1]; % Generate data for y vertices
% z = -1/C*(A*x + B*y + D); % Solve for z vertices data
% patch(x, y, z);