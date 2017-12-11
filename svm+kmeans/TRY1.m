X = 6-2*rand(1,10000);
Y = [];
Z = [];
%  for i = 1:size(X,2)
%      if i < (size(X,2))/2
%          Y(i) = 5 - (( -X(i).^2 + 10*X(i) -24 ))^(0.5)*rand(1);
%      else
%          Y(i) = 5 + (( -X(i).^2 + 10*X(i) -24 ))^(0.5)*rand(1);
%      end
%  end

for i = 1:size(X,2)
    if i < (size(X,2))/2
        Y(i) = 5 - (( -100*(X(i).^2) + 1000*X(i) -2400 ))^(0.5)*rand(1);
    else
        Y(i) = 5 + (( -100*(X(i).^2) + 1000*X(i) -2400 ))^(0.5)*rand(1);
    end
end

scatter(X,Y); hold on;

Z = [X' Y'];
Cz = (1/(size(Z,1)))*Z'*Z;

[PC,V] = eig(Cz);
[V_sorted, I] = sort(sum(-V));

PC_sorted = PC(:,I);

Z_new = Z*PC_sorted;

scatter(Z_new(:,1),Z_new(:,2)); hold off;
