clc
clear all
close all

load('C:\Users\LAVISH\Dropbox\MATLAB\prony_estimator\eq_prony_data.mat')
load('C:\Users\LAVISH\Dropbox\MATLAB\prony_estimator\conc_impact.mat')


% Y=eq_prony_data;
Y=conc_impact;

denom_order =600;
num_order = 600;
[Num,Den] = prony(Y(:,1),num_order,denom_order);
figure
plot(impz(Num,Den,length(Y)),'b','LineWidth',1.1)
hold on;
plot(Y,'k')
title ('order-600')
legend('prony fit','data input')

win=400;
denom_order =30;
num_order = 30;

figure
for i=1:win:length(Y)-win
[Num,Den] = prony(Y(i:i+win,1),num_order,denom_order);
x(i:i+win,1)=impz(Num,Den,length(Y(i:i+win,1)));
clf
subplot(2,1,1),plot(x(1:i+win),'b','LineWidth',1.1);title('Original Data')
subplot(2,1,2),plot(Y,'k');hold on; plot([i i],[-max(Y) max(Y)],'r');hold on; plot([i+win i+win],[-max(Y) max(Y)],'r')
drawnow
end

figure
plot(x,'b','LineWidth',1.1)
hold on;
plot(Y,'k')
title ('order-5')
legend('prony fit','data input')


[imf a b]=emd(Y);
% 
for i =1:11
[r,lag] = xcorr(imf(i,:),Y);
max_r(i,1)=max(r);
end
figure
plot(max_r);

% imf(2,:)+

% Y_wout_noise=imf(2,:)+imf(3,:)+imf(4,:)+imf(5,:)+imf(6,:)+imf(7,:)+imf(8,:)+imf(9,:)+imf(10,:)+imf(11,:)+imf(12,:);

Y_wout_noise=imf(6,:)+imf(7,:)+imf(8,:)+imf(9,:)+imf(10,:)+imf(11,:);

Y_wout_noise=Y_wout_noise';

% win=100;
% denom_order =30;
% num_order = 30;
figure
j=1
for i=1:win:length(Y_wout_noise)-win
[Num(j,:),Den(j,:)] = prony(Y_wout_noise(i:i+win,1),num_order,denom_order);
x(i:i+win,1)=impz(Num(j,:),Den(j,:),length(Y_wout_noise(i:i+win,1)));
clf
subplot(3,1,1),plot(x(1:i+win),'b','LineWidth',1.1);title('Without Noise')
subplot(3,1,2),plot(Y_wout_noise,'k');hold on; plot([i i],[-max(Y_wout_noise) max(Y_wout_noise)],'r');hold on; plot([i+win i+win],[-max(Y_wout_noise) max(Y_wout_noise)],'r')
% subplot(3,1,3),scatter(Num(1:j,:),Den(1:j,:));xlim([0 1]);ylim([-5 5])
drawnow
j=j+1;
end

figure
plot(x,'b','LineWidth',1.1)
hold on;
plot(Y_wout_noise,'k')
title ('without noise')
legend('prony fit','data input')

%prediction using initial few data

% denom_order =6;
% num_order = 6;
% % Y_p=zeros(size(Y_wout_noise));
% Y_p(1:500,1)=Y_wout_noise(1:500,1);
% yfinal=[];
% % figure
% for i=1:10
% [Num,Den] = prony(Y_p(:,1),num_order,denom_order);
% x=impz(Num,Den,length(Y_p(:,1)));
% % clf
% % subplot(2,1,1),plot(x,'b','LineWidth',3);title('Without Noise')
% % subplot(2,1,2),plot(Y_p,'k')%;hold on; plot([i i],[-max(Y_p) max(Y_p)],'r');hold on; plot([i+win i+win],[-max(Y_p) max(Y_p)],'r')
% % drawnow
% 
% yfinal=[yfinal;Y_p];
% Y_p=x;
% end
% figure
% plot(yfinal,'b','LineWidth',3)
% hold on;
% plot(Y_wout_noise,'k')
