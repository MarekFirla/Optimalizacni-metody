function [a,c] = BracketMinimum(f,varargin)
    len_vararg = length(varargin);
    switch len_vararg
        case 0
            x = 0; s = 1e-2; k = 2;
        case 1
            x = varargin{1}; s = 1e-2; k = 2;
        case 2
            x = varargin{1}; s = varargin{2}; k = 2;
        case 3
            x = varargin{1}; s = varargin{2}; k = varargin{3};
    end
    
    a = x; ya = f(x); b = a + s; yb = f(a+s);
    if yb > ya
        temp = a; a = b; b = temp; temp = ya; ya = yb; yb = temp;  
        s = -s;
    end
    
    while true
        c = b+s; yc = f(b+s);
        if yc > yb
            if a < c
                return 
            else
                temp = a; a = c; c = temp; 
                return
            end
        end
        a = b; ya = yb; b = c; yb = yc;
        s = s*k;
        if a==-inf||a==inf
            break
        end
    end
end

