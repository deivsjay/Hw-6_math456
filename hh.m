% Program 6.5 Hodgkin-Huxley equations
% Inputs: time interval inter,
% ic=initial voltage v and 3 gating variables, steps n
% Output: solution y
% Calls a one-step method such as rk4step.m
% Example usage: hh([0,100],[-65,0,0.3,0.6],2000);
function y = hh(int,inits,n,inps)
    global pa pb pulse
    pa = inps(1);
    pb = inps(2);
    pulse = inps(3);
    h = (int(2) - int(1))/n;
    y(1,:) = inits;
    t(1) = int(1);  
    for i = 1:n
        t(i + 1) = t(i) + h;
        y(i + 1,:) = runge_kutta(t(i),y(i,:),h);
    end
    subplot(3,1,1);
    plot([int(1) pa pa pb pb int(2)],[0 0 pulse pulse 0 0]);
    grid;
    axis([0 100 0 2*pulse]);
    ylabel('input pulse');
    title('PROBLEM 6.4-10')
    subplot(3,1,2);
    plot(t,y(:,1));
    grid;
    axis([0 100 -100 100]);
    ylabel('volts (mV)');
    subplot(3,1,3);
    
    plot(t,y(:,2),t,y(:,3),t,y(:,4));
    grid;
    axis([0 100 0 1]);
    ylabel('vars');
    legend('m','n','h');
    xlabel('t (msec)');
end
function y = runge_kutta(t,w,h)
    s1 = IVP2(t,w);
    s2 = IVP2(t + h/2,w + h*s1/2);
    s3 = IVP2(t + h/2,w + h*s2/2);
    s4 = IVP2(t + h,w + h*s3);
    y = w + h*(s1 + 2*s2 + 2*s3 + s4)/6;
end
function z = IVP2(t,w)
    global pa pb pulse
    c = 1;
    g1 = 120;
    g2 = 36;
    g3 = 0.3;
    T = (pa + pb)/2;
    e = [-65 50 -77 -54.4];
    in = pulse*(1 - sign(abs(t - T) - (pb - pa)/2))/2;
    v = w(1); 
    m = w(2);
    n = w(3);
    h = w(4);
    z = zeros(1,4);
    z(1) = (in - g1*(m^3)*h*(v - e(2)) - g2*(n^4)*(v - e(3)) - g3*(v - e(4)))/c;
    v = v - e(1);
    z(2) = (1-m)*(2.5-0.1*v)/(exp(2.5-0.1*v)-1)-m*4*exp(-v/18);
    z(3) = (1-n)*(0.1-0.01*v)/(exp(1-0.1*v)-1)-n*0.125*exp(-v/80);
    z(4) = (1-h)*0.07*exp(-v/20)-h/(exp(3-0.1*v)+1);
end