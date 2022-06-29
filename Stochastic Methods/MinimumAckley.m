clear;
clc; 
clf;
close all;

f = @(x) Ackley(x); 
GlobalMin = [0,0];
x_0=[-6;-4.5];

Z=zeros(100,100);
[X,Y]=meshgrid(linspace(-8,8),linspace(-8,8));
for i=1:100
    for j=1:100
        Z(i,j) = f([X(i,j),Y(i,j)]);
    end
end
contour(X,Y,Z,0:100); 
axis([-8,8,-8,8])
hold on;
plot(GlobalMin(1),GlobalMin(2),"k+")
plot(x_0(1),x_0(2),"k+")
iterace = 1000;

epsion=1e-6;
%x_M=MeshAdaptiveDirectSearch(f,x_0,epsion,iterace,true)

my=x_0;
sigma2=10*eye(2);
m=40;
m_e=10;
%x_C=CrossEntropyMethod(f,my,sigma2,m,m_e,iterace,true)

population_size=10;
p=0.9;
w=0.8;
%x_D=DifferentialEvolution(f,x_0,population_size,p,w,iterace,true)

population_size=100;
w=0.9;
c1=1.2;
c2=1.2;
x_P = ParticleSwarmOptimization(f,x_0,population_size,w,c1,c2,iterace,true)