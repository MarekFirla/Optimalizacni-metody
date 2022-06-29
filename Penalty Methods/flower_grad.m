function [val] = flower_grad(x)
a = 1; b = 1; c = 4;
val = [a*x(1)/norm(x) + b*cos(c*atan2(x(2),x(1)))*(-c*x(2))/(norm(x)^2);
       a*x(2)/norm(x) + b*cos(c*atan2(x(2),x(1)))*(c*x(1))/(norm(x)^2)];
end