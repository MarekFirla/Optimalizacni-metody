clear;clc;close all;

M1_area = 18;
M1_typ = 4; 
M1_tlak_perm = 5;
M2_area = 2; 
M2_typ = 4; 
M2_tlak_perm = 30;
M3_area = 7; 
M3_typ = 3;
C1_tlak = 318.515;
C2_tlak = 146.764;

lower_bounds = [  2, 0.501,   5,   2, 0.501,   5,   2, 0.501, 100, 100]';
upper_bounds = [200, 5.499, 100, 200, 5.499, 100, 200, 5.499, 500, 500]';
area_bounds = [6,30]';
recovery_bounds = [-100,-95]';
purity_bounds = [-100,-97]';

x_0= [M1_area,M1_typ, M1_tlak_perm,M2_area, M2_typ, M2_tlak_perm, M3_area, M3_typ, C1_tlak, C2_tlak]';
y_0=simulace(x_0)

%%------------------------
population_size=50;
w=0.9;
c1=0.25;
c2=0.25;
%%----------------
iter = 0;
zmena=0;
v=zeros(length(x_0),1);
x_best = x_0;
y_best = simulace(x_0);
x=zeros(length(x_0),population_size);
for i = 1:population_size
    for j = 1:length(x_0)
        temp = randn(1,1)/5;
        temp = temp+x_0(j);
        if temp < lower_bounds(j)
            temp=lower_bounds(j);
        end
        if temp > upper_bounds(j)
            temp=upper_bounds(j);
        end
        x(j,i)=temp(1);
    end
end
tic
while toc<60
    r1=rand(1);
    r2=rand(1);
    v=w*v+c1*r1*(x_best-x)+c2*r2*(x_best-x);
    x=x+v;

    for i = 1:population_size
        for j = 1:length(x_0)
            if x(j,i) < lower_bounds(j)
                x(j,i)=lower_bounds(j);
            end
            if x(j,i) > upper_bounds(j)
                x(j,i)=upper_bounds(j);
            end
        end
    end


    for i=1:population_size
        y=simulace(x(:,i));
        if y(1)<y_best(1)
            if y(2)>area_bounds(1) && y(2)<area_bounds(2)
                if y(3)>recovery_bounds(1) && y(3)<recovery_bounds(2)
                    if y(4)>purity_bounds(1) && y(4)<purity_bounds(2)
                        x_best=x(:,i);
                        y_best=simulace(x_best);
                        zmena = zmena +1;
                    end
                end
            end
        end
    end
    iter=iter+1;
end
y=simulace(x_best)
x_best=x_best'
toc
