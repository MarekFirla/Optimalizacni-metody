function [MinFceA,MinFceB] = GoldenSearch(f,a,b,n)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
fi = (1+sqrt(5))/2;
ro = fi - 1;
d = ro*b + (1-ro)*a;
yd = f(d);

for i = 1:(n-1)
    c=ro*a+(1-ro)*b;
    yc = f(c);
    if yc < yd
        b=d;
        d=c;
        yd=yc;
    else
        a=b;
        b=c;
    end
end
if a<b
    MinFceA = a;
    MinFceB = b;
else
    MinFceA = b;
    MinFceB = a;
end
end