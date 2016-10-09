function y = beuler_compare(f,df,int,init,n,part)
    h = (int(2) - int(1))/n;
    wi = init;
    x = wi;
    tn = int(1);
    y(1,:) = init;
    t(1) = int(1);

    for i = 1:n
        tn = tn + h;
        
        for k = 1:5
           x = x - (h * df(tn,x) - 1)\(h*f(tn,x) - x + wi); 
        end
        
        wi = x;
        y(i + 1,:) = x;
        t(i + 1) = tn;
    end
    
    t(1) = int(1);
    y1(1) = init;
    
    for i = 1:n
        t(i + 1) = t(i) + h;
        y1(i + 1) = estep(y1(i),h,part);
    end
    
    plot(t,y,'r')
    hold on
    plot(t,y1,'b')
    xlabel('t')
    ylabel('y(t)')
    title('PROBLEM 6.6-2: Backward Euler Method & Euler Method solns')
end

function y1 = estep(y1,h,part)
    if part == 8
        y1 = y1 + h*IVP8(y1);
    elseif part == 9
        y1 = y1 + h*IVP9(y1);
    end
end

function z = IVP8(y1)
    z = 6*y1 - 3*(y1^2);
end

function z = IVP9(y1)
    z = 10*y1 - 10*(y1^2);
end