function [y] = rosenbrock(x)
    a = 1; 
    b = 5;
    y = (a-x(1))^2 + b*(x(2)-x(1)^2)^2;
end