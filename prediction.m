function [t,y] = prediction(int,inits,n,s,part)
    h = (int(2) - int(1))/n;
    y(1,:) = inits;
    t(1) = int(1);
    
    for i = 1:s - 1
        t(i + 1) = t(i) + h;
        y(i + 1,:) = tstep(t(i),y(i,:),h);
        f(i,:) = IVP7(t(i),y(i,:));
    end
    
    for i = s:n
        t(i + 1) = t(i) + h;
        f(i,:) = IVP7(t(i),y(i,:));
        y(i + 1,:) = adams_bashforth(i,y,f,h);
        f(i + 1,:) = IVP7(t(i + 1),y(i + 1,:));
        y(i + 1,:) = adams_moulton(i,y,f,h);
    end
    
    if part == 7
        plot(t,y)
        xlabel('t')
        ylabel('y')
        grid on
        title('PROBLEM 6.7-10: 3rd-Order Predictor-Corrector Method');
    elseif part == 8
        diffeq = dsolve('Dy = t*y + t*3','y(0) = 1','t');
        disp('Differential equation:')
        disp('Dy = sin(y) with exact solution:')
        disp(diffeq);
    
        for i = 1:101
            m(i) = 0;
            w(i) = 0;
            z(i) = 0;
        end

        for i = 0:n
            m(i + 1) = m(i + 1) + i*h;
            t = m(i + 1);
            w(i + 1) = z(i + 1) + y(i + 1);
        end
        
        plot(m,w);
        hold on
        plot(m,z)
        xlabel('t')
        ylabel('y')
        grid on
        title('Approximate vs. Correct solns')
    end
end

function y = tstep(t,x,h)
    z1 = IVP7(t,x);
    g = x + h*z1;
    z2 = IVP7(t + h,g);
    y = x + h*(z1 + z2)/2;
end

function z = IVP7(t,y)
    z = t*y + t^3;
end

function z = adams_bashforth(i,y,f,h)
    z=y(i,:)+h*(55*f(i,:)-59*f(i-1,:)+37*f(i-2,:)-9*f(i-3,:))/24;
end

function z = adams_moulton(i,y,f,h)
    z=y(i,:)+h*(9*f(i+1,:)+19*f(i,:)-5*f(i-1,:)+f(i-2,:))/24;
end