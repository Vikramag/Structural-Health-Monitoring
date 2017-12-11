
function X_end=sigma1(X1)

%X1 = [1 2 ; 0 0; -1 -2];

[m,n]= size(X1);
sigma11 = std(X1)
covv = diag(cov(X1))
msd1=bsxfun(@minus,X1,mean(X1));% mean subtracted data

temp = zeros(m,n);
temp2 = zeros(m,1);
temp = bsxfun(@rdivide,msd1,covv')
temp2 = diag(temp*temp')

X_end = X1(find(temp2<4.605),:);
end

    
    
% for i=1:m
%     temp(i,:)= abs(msd1(i,:))<sigma11;
%     if temp(i,:)==ones(1,n)
%         temp2(i)=1;
%     end        
% end
% for i=1:m
%     dis = 0;
%     for j=1:n
%         dis = dis + sigma11(j)*msd1(i,j)^2;
%     end
%     dis = (dis^0.5)/(sigma11*sigma11');
%     
%     for j= (1:n)
%         
%         temp(i,j)= sigma11(j)*dis<sigma11(j);
%     end
%     if temp(i,:)==ones(1,n)
%         temp2(i)=1;
%     end        
% end

% X_end = X1(find(temp2==1),:);



% a1 = 1;
% b1 = 0;
% x1 = randn(1000,1);

% x = [-3:.1:3];
% norm = normpdf(x,0,1);
% figure;
% plot(x,norm,'ko');
    