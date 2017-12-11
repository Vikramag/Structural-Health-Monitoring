function [num_all, den_all] =   pronyy(X,order)

denom_order =order;
num_order = order;

%[Num,Den] = prony(X(:,1),num_order,denom_order);

%plot(impz(Num,Den,length(X)),'r','LineWidth',2)
%hold on;
%plot(X,'k')


win=10000;
num_all =[];
den_all = [];
figure
for i=1:win:length(X)-win
    [Num,Den] = prony(X(i:i+win,1),order,order);
    num_all = vertcat(num_all, Num);
    den_all = [den_all; Den(1:end)];
    x(i:i+win,1)=impz(Num,Den,length(X(i:i+win,1)));
    
    clf
    subplot(2,1,1),plot(x(1:i+win),'b','LineWidth',1.1)
    xlim([0,length(X)]);
    %subplot(2,1,2),plot(X,'k');hold on; plot([i i],[-1 1],'r');hold on; plot([i+win i+win],[-1 1],'r')
    xlim([0,length(X)]);
    subplot(2,1,2),plot(num_all(:,1),num_all(:,2),'ko','MarkerSize',2)
    xlabel('Numerator Row 1');
    ylabel('Numerator Row 2');
    drawnow,
end
hold off;
figure
plot(x,'r','LineWidth',2)
hold on;
plot(X,'k')
title(['order-',num2str(order)])
legend('prony fit','data input')


end