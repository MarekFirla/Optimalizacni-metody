function [x] = NelderMead(f,S,epsilon,iterace,varargin)
leng_var = length(varargin);
switch leng_var
    case 0
      alpha=1;
      beta=2;
      gama=0.5;
    case 1
        alpha = varargin{1};
        beta=2;
        gama=0.5;
    case 2 
        alpha = varargin{1};
        beta = varargin{2}; 
        gama=0.5;
    case 3
        alpha = varargin{1};
        beta = varargin{2}; 
        gama = varargin{3};
end
pocitadlo = 1;
delta = inf;
for i = 1:3
    a = S(:,i);
    y(i) = f(a);
end
while abs(delta) > epsilon
    [y,a] = sort(y);
    S = S(:,a);
    xl = S(:,1); 
    yl = y(:,1);
    xh = S(:,end); 
    yh = y(:,end);
    xs = S(:,end-1);
    ys=y(:,end-1);
    xm = (mean(S(:,1:end-1)'))';
    xr = xm+alpha*(xm-xh); 
    yr = f(xr);
    if yr < yl
        xe = xm + beta*(xr-xm); ye = f(xe);
        if ye < yr
            S(:,end) = xe; 
            y(end) = ye;
        else
            S(:,end) = xr; 
            y(end) = yr;
        end
    elseif yr > ys
        if yr <= yh
            xh = xr; yh = yr;
            S(:,end) = xr; 
            y(end) = yr;
        end
        xc = xm+gama*(xh-xm); yc = f(xc);
        if yc > yh
            for i = 2:length(y)
                S(:,i) = (S(:,i)+xl)/2; 
                y(i) = f(S(:,i));
            end
        else
            S(:,end) = xc;
            y(end) = yc;
        end
    else
        S(:,end) = xr;
        y(end) = yr;
    end
    line([xh(1), xs(1)], [xh(2), xs(2)], 'Color', 'k'); 
    line([xl(1), xs(1)], [xl(2), xs(2)], 'Color', 'k');
    line([xh(1), xl(1)], [xh(2), xl(2)], 'Color', 'k');
    pocitadlo = pocitadlo + 1;
    delta = std(y);
    if pocitadlo > iterace
        break; 
    end 
end
x=S;
end

