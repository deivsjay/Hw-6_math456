function multistep(int,inits,n,s,part)
    h = (int(2) - int(1))/n;
    y(1,:) = inits;
    t(1) = int(1);
    
    for i = 1:s - 1
        t(i + 1) = t(i) + h;
        y(i + 1,:) = tstep(t(i),y(i,:),h);
        f(i,:) = IVP3(t(i),y(i,:));
    end
    
    for i = s:n + 2
       t(i + 1) = t(i) + h;
       f(i,:) = IVP3(t(i),y(i,:));
       y(i + 1,:) = y(i,:) + h*(23*f(i,:) - 16*f(i - 1,:) + 5*f(i - 2,:))/12;
       plot(t,y)
       xlabel('t'),ylabel('y'),grid on
       
       switch part
           case 1
                title('PROBLEM 6.7-6: Adams-Bashforth 3-Step Method: Part A')
           case 2
                title('PROBLEM 6.7-6: Adams-Bashforth 3-Step Method: Part B')
           case 3
                title('PROBLEM 6.7-6: Adams-Bashforth 3-Step Method: Part C')
           case 4
                title('PROBLEM 6.7-6: Adams-Bashforth 3-Step Method: Part D')
       end
    end
    
    yfun = dsolve('Dy = 1 - y^2','y(0) = 0','t');
    
    disp('The IVP is Dy = 1 - y^2 and the solution of IVP is:');
    disp(yfun);
    
    f = @(t,y)1 - y^2;
    
    disp('---------------------------------------')
    disp('Step   | Approximate | Actual     Error')
    disp('size h | solutions   | solutions')
    disp('---------------------------------------')
    
    for k = 0:n
        t = k/10;
        a(k + 1) = eval(yfun);
        p(k + 1) = h/10;
        a(k + 1) = eval(yfun);
        
        disp([p(k + 1),y(k + 1),a(k + 1),a(k + 1) - y(k + 1)])
    end
end

function y = tstep(t,x,h)
    z1 = IVP3(t,x);
    g = x + h*z1;
    z2 = IVP3(t + h,g);
    y = x + h*(z1 + z2)/2;
end

function z = IVP3(t,y)
    z = 1 - y^2;
end