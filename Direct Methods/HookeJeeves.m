function [x] = HookeJeeves(f,x,alpha,epsilon,iterace,gama)
if ~exist('gamma','var')
     % third parameter does not exist, so default it to something
      gama =0.5;
end

y=f(x);
n=length(x);
pocitadlo=0;
while alpha > epsilon
    improved = false;
    x_best = x;
    y_best = y;

    for k = 1:n
        for sgn = [-1,1]
            A = eye(n); 
            d = A(:,k);
            x_n = x + sgn*alpha*d;
            y_n = f(x_n);
            if y_n < y_best
                x_best = x_n;
                y_best = y_n;
                improved = true;
            end
        end
     end

    plot3([x(1),x_best(1)],[x(2),x_best(2)],[0,0],'r-x');
    x = x_best;
    y = y_best;

    if ~improved
        alpha = alpha * gama;
    end

    if pocitadlo > iterace
        break; 
    end
    pocitadlo = pocitadlo + 1;
end
end

