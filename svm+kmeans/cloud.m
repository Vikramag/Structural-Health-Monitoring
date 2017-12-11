function [X1,X2] = cloud()
%% generates two clouds with different means. 

%first cloud with center close to 0
x1 = -1+2*rand(1,1000);                     %x1 is between -1 and 1
y1 = (-1+2*rand(1,1000)).*(1-x1.^2);        
z1 = (-1+2*rand(1,1000)).*(1-x1.^2-y1.^2);  % y1 and z1 are formulated to form a sphere 
X1 = [x1',y1',z1'];                         

%second cloud
x2 = -1+2*rand(1,1000);
y2 = (-1+2*rand(1,1000)).*(1-x2.^2);
z2 = (-1+2*rand(1,1000)).*(1-x2.^2-y2.^2);
%these equations shift the second cloud's center to approx [1,1,1]
x2=x2+1;                                    
y2=y2+1;
z2=z2+1;
X2 = [x2',y2',z2'];


