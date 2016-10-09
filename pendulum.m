function pendulum(int,inits,n)
    h = (int(2) - int(1)) / n;
    y(1,:) = inits;
    t(1) = int(1);
    set(gca,'xlim',[-1.2 1.2],'ylim',[-1.2 1.2],...
        'Xtick',[-1 0 1],'Ytick',[-1 0 1],...
        'Drawmode','fast','Visible','on','NextPlot','add');
    cla;
    axis square
    bob = line('color','r','Marker','.','markersize',40,...
        'erase','xor','xdata',[],'ydata',[]);
    rod = line('color','b','LineStyle','-','LineWidth',3,...
        'erase','xor','xdata',[],'ydata',[]);
    title('PROBLEM 6.3-6')
    
    for k=1:n
        t(k+1) = t(k) + h;
        y(k+1,:) = tstep(t(k),y(k,:),h);
        xbob = sin(y(k+1,1));
        ybob = -cos(y(k+1,1));
        xrod = [0 xbob];
        yrod = [0 ybob];
        set(rod,'xdata',xrod,'ydata',yrod)
        set(bob,'xdata',xbob,'ydata',ybob)
        drawnow;
        pause(h)
    end
end

function y = tstep(t,x,h)
    z1 = IVP1(t,x);
    g = x + h*z1;
    z2 = IVP1(t + h,g);
    y = x + h*(z1 + z2)/2;
end

function z = IVP1(t,y)
    g = 9.81;
    length = 2.5;
    z(1) = y(2);
    z(2) = -0.1*y(2) - (g/length + 0*cos(2*pi*t))*sin(y(1));
end
    
