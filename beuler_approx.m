function y = beuler_approx(f,df,int,ya,n)
    h = (int(2) - int(1))/n;
    wi = ya;
    x = wi;
    tn = int(1);
    y(1,:) = ya;
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
    
    plot(t,y)
    xlabel('t')
    ylabel('y(t)')
    title('PROBLEM 6.6-2: Backward Euler Method approx solns')
end