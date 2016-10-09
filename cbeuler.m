function y = cbeuler(f,df,interval,initial,n,kind)
    h = (interval(2) - interval(1))/n;
    wi = initial;
    x = wi;
    tn = interval(1);
    y(1,:) = initial;
    t(1) = interval(1);
    for i = 1:n
        tn = tn + h;
        for k = 1:5
           x = x - (h * df(tn,x) - 1)\(h*f(tn,x) - x + wi); 
        end
        wi = x;
        y(i + 1,:) = x;
        t(i + 1) = tn;
    end
    t(1) = interval(1);
    y1(1) = initial; 
    for i = 1:n
        t(i + 1) = t(i) + h;
        y1(i + 1) = estep(y1(i),h,kind);
    end
    plot(t,y,'r')
    hold on
    plot(t,y1,'b')
end
function y1 = estep(y1,h,kind)
    if kind == 8
        y1 = y1 + h*(6*y1 - 3*(y1^2));
    elseif kind == 9
        y1 = y1 + h*(10*y1 - 10*(y1^2));
    end
end
