function [x] = QuasiNewtonAugmentedLagrangeMethod(f,constr,penalty_quad,grad,x,ro,epsion,iterace)
g = grad(x);
pocitadlo=1;
Q=eye(2);
lambda=0;
while norm(g) > epsion
    f_l = @(alpha) f(x(:,end) - alpha*Q*g) + (ro(pocitadlo)/2)*(penalty_quad(x(:,end)-alpha*Q*g) - lambda*constr(x(:,end)-alpha*Q*g));
    [a,c] = BracketMinimum(f_l);
    if a == -inf||a==inf
        break;
    end
    [a,b] = GoldenSearch(f_l,a,c,10);
    alpha = (a+b)/2;
    lambda = lambda-ro(pocitadlo)*constr(x(:,end) - alpha*Q*g);
    x_new = x(:,end) - alpha*Q*g;
    delta = x_new - x;
    gk_1 = grad(x_new);
    gama = gk_1 - g;
    g(:,end) = gk_1;
    Q = Q-(((Q*gama)*(gama'*Q))/(gama'*Q*gama))+((delta*delta')/(delta'*gama));
    if pocitadlo > iterace
        break;
    end
    plot3([x(1),x_new(1)],[x(2),x_new(2)],[0,0],'r-x');
    
    pocitadlo = pocitadlo + 1;
    x(:,end) = x_new;
end

