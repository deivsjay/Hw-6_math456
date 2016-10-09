function [t,y] = euler_trap(int,y0,n,part)
    t(1) = int(1);
    y(1,:) = y0;
    h = (int(2) - int(1))/n;
    
    for i = 1:n
        t(i + 1) = t(i) + h;
        y(i + 1,:) = tstep(t(i),y(i,:),h,part);
    end
    
    plot(t,y(:,1),t,y(:,2));
    xlabel('t')
    ylabel('y')
    grid on
    
    switch part
        case 4
            title('PROBLEM 6.3-4(E): Trapezoid Method Approximations - Part A')
        case 5
            title('PROBLEM 6.3-4(E): Trapezoid Method Approximations - Part B')
        case 6
            title('PROBLEM 6.3-4(E): Trapezoid Method Approximations - Part C')
    end
end

function y = tstep(t,x,h,part)
    switch part
        case 4 
            z1 = IVP4(t,x);
        case 5 
            z1 = IVP5(t,x);
        case 6 
            z1 = IVP6(t,x);
    end
    
    g = x + h*z1;
    
    switch part    
        case 4
            z2 = IVP4(t + h,g);
        case 5
            z2 = IVP5(t + h,g);
        case 6
            z2 = IVP6(t + h,g);
    end
    
    y = x + h*(z1 + z2)/2;
end

function z = IVP4(t,y)
    z(1) = y(2);
    z(2) = t*y(1);
end

function z = IVP5(t,y)
    z(1) = y(2);
    z(2) = 2*t*y(2) - 2*y(1);
end

function z = IVP6(t,y)
    z(1) = y(2);
    z(2) = t*y(2) + y(1);
end