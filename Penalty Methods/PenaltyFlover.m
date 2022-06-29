clear;
clc;
clf;

f = @(x) flower(x);
f_grad = @(x) flower_grad(x);

constr = @(x) -x(1)^2 - x(2)^2 + 2;
constr_grad = @(x) [-2*x(1); -2*x(2)];

penalty_quad = @(x) max(constr(x),0)^2;
penalty_quad_grad = @(x) 2*max(constr(x),0).*constr_grad(x);
penalty_count = @(x) (constr(x) > 0);

x_0=[-2;-2];

Z=zeros(100,100);
[X,Y]=meshgrid(linspace(-8,8),linspace(-8,8));

for i=1:100
    for j=1:100
        Z(i,j) = f([X(i,j),Y(i,j)]);
    end
end

contour(X,Y,Z,0:100);
hold on;
axis([-3,3,-3,3])
plot(x_0(1),x_0(2),"k+")

ang=0:0.01:2*pi;
r=sqrt(2);
x_kr=r*cos(ang);
y_kr=r*sin(ang);
plot(x_kr,y_kr,"g");
iterace = 100;

ro = [0.5, 1, 5, 10];
x_H=HookeJeevesPenalty(f,penalty_count,x_0,ro,0.1,1e-6,iterace)

ro = [10];
population_size=10;
p=0.9;
w=0.8;
x_D=DifferentialEvolutionPenalty(f,penalty_count,x_0,ro,population_size,p,w,iterace,true)

epsion=1e-2;
ro=[0.01, 0.5, 1, 4, 8, 16];
x_Q=QuasiNewtonPenalty(f,f_grad,penalty_quad,penalty_quad_grad,x_0,ro,epsion,iterace)

epsion=1e-2;
ro = [0.01, 0.5, 1, 4, 8, 16];
x_QL=QuasiNewtonAugmentedLagrangeMethod(f,constr,penalty_quad,f_grad,x_0,ro,epsion,iterace)



