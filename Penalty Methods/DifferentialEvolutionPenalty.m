function [x] = DifferentialEvolutionPenalty(f,penalty_count,x_0,ro,population_size,p,w,iterace,vykreslit)
pocitadlo = 0;
x=zeros(2,population_size);
x_new=zeros(2,population_size);
for i = 1:population_size
    temp = randn(2,1);
    temp = temp+x_0;
    x(1,i)=temp(1);
    x(2,i)=temp(2);
end
if vykreslit
    h=plot(x(1,:),x(2,:),"+r");
end

while iterace>pocitadlo
    for j=1:population_size
        temp=randperm(population_size);
        a=temp(1);
        b=temp(2);
        c=temp(3);

        i_rand=(randperm(2));
        i_rand=i_rand(1);

        for i=1:length(x_0)
            if i==i_rand || rand(1)<p
                x_new(i,j) = x(i,c)+w*(x(i,a)-x(i,b));
            else
                x_new(i,j) = x(i,j);
            end
        end

        y=f(x(:,j))+ro*penalty_count(x(:,j));
        y_new=f(x_new(:,j))+ro*penalty_count(x_new(:,j));
        if y>y_new
            x(:,j)=x_new(:,j);
        end

        if vykreslit
            delete(h);
            h=plot(x(1,:),x(2,:),"r+");
            pause(0.005);
        end

    end
    pocitadlo=pocitadlo+1;
end

for i=1:population_size
    y(i)=f(x(:,i));
end
[~,index_y]=min(y);
x=x(:,index_y);
end