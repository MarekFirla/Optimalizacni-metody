function [y] = rosenbrock_grad(x)
    a = 1; 
    b = 5;
    y = [-2*(a-x(1))+2*b*(x(2)-x(1)^2)*(-2*x(1)); 2*b*(x(2)-x(1)^2)];
end

