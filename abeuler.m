function y = abeuler(f,df,int,zee,n)
    h = (int(2) - int(1))/n;
    wi = zee;
    x = wi;
    tnm = int(1);
    y(1,:) = zee;
    t(1) = int(1);
    for i = 1:n
        tnm = tnm + h;
        for k = 1:5
           x = x - (h * df(tnm,x) - 1)\(h*f(tnm,x) - x + wi); 
        end
        wi = x;
        y(i + 1,:) = x;
        t(i + 1) = tnm;
    end
    plot(t,y)
end