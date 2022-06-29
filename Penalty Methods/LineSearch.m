function [x] = LineSearch(f,x,d)
    f_line = @(alfa) f(x(:,end) + alfa*d);
    [a,b] = BracketMinimum(f_line);
    [alfa] = GoldenSearch(f_line, a,b,5);
    x = x+alfa*d;
end