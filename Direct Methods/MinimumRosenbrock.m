clear;
clc; 
clf;
close all;

f = @(x) rosenbrock(x); 
GlobalMin = [1,1];
x_0=[-1;-1];
grad = @(x) rosenbrock_grad(x);
 
[X,Y]=meshgrid(linspace(-2,2),linspace(-2,2));
for i=1:100
    for j=1:100
        Z(i,j) = f([X(i,j),Y(i,j)]);
    end
end
contour(X,Y,Z,0:100); 
hold on;
plot(GlobalMin(1),GlobalMin(2),"k+")
iterace = 1000;

epsion = 1e-4;
x_C = CyclicCoordinateDescentWithAccelerationStep(f,x_0,epsion,iterace);

alfa =1;
epsion = 1e-6;
%x_H = HookeJeeves(f,x_0,alfa,epsion,iterace);

epsion = 1e-6;
S=[-1 -0.8 -0.5 ; -1 -0.8 -1];
%x_N = NelderMead(f,S,epsion,iterace);

epsion = 1e-2;
%x_Q=QuasiNewton(f,grad,x_0,epsion,iterace);
