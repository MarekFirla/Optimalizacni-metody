function [my] = CrossEntropyMethod(f,my,sigma2,m,m_e,iterace,vykreslit)
pocitadlo = 0;

x=zeros(2,m);
S=zeros(1,m);
pocitadlo = 0;
while pocitadlo < iterace
    for i = 1:m
    temp = mvnrnd(my,sigma2)';

    x(1,i)=temp(1);
    x(2,i)=temp(2);
    end

    for i = 1:m
    S(i) = f(x(:,i));
    end
    [~,indexS] = sort(S);  
    x=x(:,indexS);
  
    my_new = [mean(x(1,1:m_e));mean(x(2,1:m_e))];

    if vykreslit
    plot3([my(1),my_new(1)],[my(2),my_new(2)],[0,0],'r-x');
    pause(0.05)
    end
    my=my_new;

    temp=0;
    for i=1:m_e
        temp = ((x(:,i:m_e)-my)*(x(:,i:m_e)-my)')+temp;
    end
    sigma2 = (1/m_e).*temp;
    pocitadlo = pocitadlo + 1;
end
end


