function [D] = RandPositiveSpanningSet(alfa,n)
delta=round(1/sqrt(alfa));
l=diag(delta*(2*rand(n,1))-1);
for i=1:n-1
    for j=i+1:n
        l(i,j)=(2*delta+2)*rand(1)-delta+1;
    end
end
D=l(:,randperm(n));
D=D(randperm(n),:);
D=[D,-sum(D,2)];
end