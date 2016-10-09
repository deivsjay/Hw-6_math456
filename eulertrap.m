function [t,y] = eulertrap(int,y0,n,part)
    t(1) = int(1);
    y(1,:) = y0;
    h = (int(2) - int(1))/n;
    for i = 1:n
        t(i + 1) = t(i) + h;
        y(i + 1,:) = t_s(t(i),y(i,:),h,part);
    end
    plot(t,y(:,1),t,y(:,2));
end

function y = t_s(t,x,h,part)
    switch part
        case 4 
            w1(1) = x(2);
            w1(2) = t*x(1);
        case 5 
            w1(1) = x(2);
            w1(2) = 2*t*x(2) - 2*x(1);
        case 6 
           w1(1) = x(2);
           w1(2) = t*x(2) + x(1);
    end
    g = x + h*w1;
    switch part    
        case 4
            w2(1) = g(2);
            w2(2) = (t+h)*g(1);
        case 5
            w2(1) = g(2);
            w2(2) = 2*(t+h)*g(2) - 2*g(1);
        case 6
            w2(1) = g(2);
            w2(2) = (t+h)*g(2) + g(1);
    end
    y = x + h*(w1 + w2)/2;
end