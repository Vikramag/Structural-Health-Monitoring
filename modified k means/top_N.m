function [X1,X2,y,L1,L2] = top_N(D1,D2,N,X1,X2,y)
%% this file removes top N most distant points from each cluster
length_= size(X2,1);
[ ~, ix ] = sort( D2(:), 'descend' );
%% rr is the index of top 10 points
[ rr, cc ] = ind2sub( size(D2), ix(1:N) ) ;
plot3(X2(rr,1),X2(rr,2),X2(rr,3),'kh')
L2 = X2(rr,:);
X2(rr,:)=[];
y(rr+length_,:)=[];


%%

[ ~, ix ] = sort( D1(:), 'descend' );
%% rr is the index of top 10 points
[ rr, cc ] = ind2sub( size(D1), ix(1:N) ) ;
plot3(X1(rr,1),X1(rr,2),X1(rr,3),'kh')
L1 = X1(rr,:);
X1(rr,:)=[];

y(rr,:)=[];

%% for seeing distance

% for i = 1 : N
%    top_ten_points = D0( rr(i), cc(i) ) ;
% end
end