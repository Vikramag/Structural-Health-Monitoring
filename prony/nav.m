close all;
freq1 = 1.5;
freq2 =5;
order1 = 4;
order2 = 4;

X1 = syn(freq1);

X2 = syn(freq2);
[Num1, Den1] =pronyy(X1,order1);

[Num2, Den2] =pronyy(X2,order2);
figure
xlabel('Numerator Row 1');
ylabel('Numerator Row 2');
plot(Num1(:,1),Num1(:,2),'ko')

hold on

xlabel('Numerator Row 1');
ylabel('Numerator Row 2');
plot(Num2(:,1),Num2(:,2),'rx')

legend('high freq data','low freq data')


