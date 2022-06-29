function [x] = ParticleSwarmOptimization(f,x_0,population_size,w,c1,c2,iterace,vykreslit)
pocitadlo = 0;
v=[0;0];
x_best = x_0;
x=zeros(length(x_0),population_size);
for i = 1:population_size
    temp = randn(2,1);
    temp = temp+x_0;
    for j =1:length(x_0)
        x(j,i)=temp(j);
    end
end

if vykreslit
    h=plot(x(1,:),x(2,:),"+r");
end

while pocitadlo<iterace
    
    r1=rand(1);
    r2=rand(1);
    v=w*v+c1*r1*(x_best-x)+c2*r2*(x_best-x);
    x=x+v;

    for i=1:population_size
        if f(x(:,i))<f(x_best)
            x_best=x(:,i);
        end
    end

    if vykreslit
        delete(h);
        h=plot(x(1,:),x(2,:),"r+");
        pause(0.02);
    end

    pocitadlo=pocitadlo+1;
end

for i=1:population_size
    y(i)=f(x(:,i));
end
[~,index_y]=min(y);
x=x(:,index_y);

end