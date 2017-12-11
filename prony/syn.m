function X = syn(freq)
% X1 is an exponentially decaying sinusoidal function impended on another sine function
% Y is an exponentially decaying sinusoidal function
% first part of X is X1(upto t =20sec ) and second part is Y(from t = 20sec to t=40sec)
A =10;


a= 0.0002;
t=0:a:20;
X1 = A*exp(-0.1*t).*sin(2*pi*freq*t).*sin(2*pi*0.2*t);
t=20+a:a:40;
Y = A*exp(-0.1*t).*sin(2*pi*freq*t);
X = [X1 Y];
X=X';
end

