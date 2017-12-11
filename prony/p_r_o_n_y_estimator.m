% d = designfilt('lowpassiir','NumeratorOrder',4,'DenominatorOrder',4, ...
%     'HalfPowerFrequency',0.2,'DesignMethod','butter');
% 
% impulse_resp = filter(d,[1 zeros(1,31)]);
clc
clear all
close all

f=10;
w1=2*pi*f;
w2=2*pi*100;
w3=2*pi*300;
zeta=0.02;
t=0:0.001:1;
y1=sin((w1)*t)';
y2=sin((w2)*t)';
y3=sin((w3)*t)';
y=y1+y2+y3;
% i=1;
% for t=0:0.001:1
%     
% % y(i,1)=(exp(-zeta*(w1)*t))*sin((w1+w2)*t);
% y(i,1)=sin((w1)*t);
% i=i+1;  
% end
y=y;


%for y1
denom_order =6;
num_order = 6;

[Num,Den] = prony(y1(:,1),num_order,denom_order);
figure
plot(impz(Num,Den,length(y1)),'b','LineWidth',1.1)
hold on;
plot(y1,'k')
title ('order-6, f=10 Hz')
legend('prony fit','data input')

%for y2
denom_order =4;
num_order = 4;
[Num,Den] = prony(y2(:,1),num_order,denom_order);
figure
plot(impz(Num,Den,length(y2)),'b','LineWidth',1.1)
hold on;
plot(y2,'k')
title ('order-4, f=500 Hz')
legend('prony fit','data input')

%for y=y1+y2+y3
denom_order =6;
num_order = 6;
[Num,Den] = prony(y(:,1),num_order,denom_order);
figure
plot(impz(Num,Den,length(y)),'b','LineWidth',1.1)
hold on;
plot(y,'k')
title ('order-6, 3 freq added')
legend('prony fit','data input')

%for y=[y1;y2]
Y=[y1;y2];
denom_order =1100;
num_order = 1100;
[Num,Den] = prony(Y(:,1),num_order,denom_order);
figure
plot(impz(Num,Den,length(Y)),'b','LineWidth',1.1)
hold on;
plot(Y,'k')
title ('order-1100, 2 freq appended')
legend('prony fit','data input')

% window wise for appended signal

Y=Y+0.2*randn(2002,1);


win=20;
denom_order =3;
num_order = 3;
figure
for i=1:win:length(Y)-win
[Num,Den] = prony(Y(i:i+win,1),num_order,denom_order);
x(i:i+win,1)=impz(Num,Den,length(Y(i:i+win,1)));
clf
subplot(2,1,1),plot(x(1:i+win),'b','LineWidth',1.1)
subplot(2,1,2),plot(Y,'k');hold on; plot([i i],[-1 1],'r');hold on; plot([i+win i+win],[-1 1],'r')
drawnow
end

figure
plot(x,'b','LineWidth',1.1)
hold on;
plot(Y,'k')
title ('order-3')
legend('prony fit','data input')
