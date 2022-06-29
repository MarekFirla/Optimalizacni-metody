function [x] = MeshAdaptiveDirectSearch(f,x,epsion,iterace,vykreslit)
alfa=1;
y=f(x);
n=length(x);
pocitadlo = 0;

while alfa>epsion
    improved=false;
    D=RandPositiveSpanningSet(alfa,n);
    for i=1:n+1
        d=D(:,i);
        x_p=x+alfa*d;
        y_p=f(x_p);
        if y_p < y
            x_new=x_p;
            y=y_p;
            improved=true;
            x_p=x_new+3*alfa*d;
            y_p=f(x_p);
            if y_p < y
                x_new=x_p;
                y=y_p;
            end
            break
        end
    end

    if improved
        alfa=min(4*alfa,1);
    else
        alfa=alfa/4;
    end

    pocitadlo=pocitadlo+1;
    if vykreslit
    plot3([x(1),x_new(1)],[x(2),x_new(2)],[0,0],'r-x');
    pause(0.1);
    end
    x=x_new;

    if iterace<pocitadlo
        break
    end

end
end