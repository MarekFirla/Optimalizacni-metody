function [x] = CyclicCoordinateDescentWithAccelerationStep(f,x,epsion,iterace)
n = length(x);
pocitado = 0;
x_new = x;
delta=inf;
while abs(delta) > epsion
    x1 = x;
    for i = 1:n
        A = eye(n); 
        d = A(:,i);
        x = LineSearch(f,x,d);
    end
    x = LineSearch(f,x,(x-x1));
    delta = norm(x-x1);

    x_new(:,end+1) = x;
    plot3([x(1,end),x_new(1,end-1)],[x(2,end),x_new(2,end-1)],[0,0],'r-x');
    pocitado = pocitado + 1;
    if pocitado > iterace
        break; 
    end    
end
end