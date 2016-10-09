clear
clc
warning('off','all');

% Problem 6.3 Exercise 4

% a.)

[t y] = eulertrap([0 1],[1 1],4,4);
figure

% b.)

[t y] = eulertrap([0 1],[1 1],4,5);
figure 

% c.)

[t y] = eulertrap([0 1],[1 1],4,6);
figure

% Problem 6.4.10

% (a)

hh([0,100],[-65,0,0.3,0.6],2000,[50 51 6.9216]);
figure 

% (b)

hh([0,100],[-65,0,0.3,0.6],2000,[50 55 2.352]);
figure

% (c)

hh([0,100],[-65,0,0.3,0.6],2000,[50 55 4.704]);
figure

hh([0,100],[-65,0,0.3,0.6],2000,[50 60 2.352]);
figure

% (d)

hh([0,100],[-65,0,0.3,0.6],2000,[50 60 2]);
figure

hh([0,100],[-65,0,0.3,0.6],2000,[50 60 5]);
figure

hh([0,100],[-65,0,0.3,0.6],2000,[50 60 9]);
figure

hh([0,100],[-65,0,0.3,0.6],2000,[50 60 9]);
figure

% Problem 6.5.4

tol = 1e-8;
opts = odeset('RelTol',tol);

% a.)

[t1,y1] = ode45(@(t,y)t,[0 1],1,opts);

% b.)

[t2,y2] = ode45(@(t,y)(t^2)*y,[0 1],1,opts);

% c.)

[t3,y3] = ode45(@(t,y)2*(t + 1)*y,[0 1],1,opts);

% d.)

[t4,y4] = ode45(@(t,y)5*(t^4)*y,[0 1],1,opts);

% e.)

[t5,y5] = ode45(@(t,y)1/(y^2),[0 1],1,opts);

% f.)

[t6,y6] = ode45(@(t,y)(t^3)/(y^2),[0 1],1,opts);

% Problem 6.6.2

% a.)

f = @(t,y)6*y - 3*y^2;
df = @(t,y)6 - 6*y;

abeuler(f,df,[0 20],0.5,20);
figure

cbeuler(f,df,[0 1],0.5,10,8);
figure

% b.)

f = @(t,y)10*y^3 - 10*y^4;
df = @(t,y)6 - 12*y;

abeuler(f,df,[0 20],0.5,20);
figure

cbeuler(f,df,[0 1],0.5,10,9);
figure

% Problem 6.7.8

% a.)

exmultistep([0,2],1/4,40,3);

% b.)

exmultistep([0,1/4],2,3,3);
exmultistep([0,1/4],2,80,3);

% Problem 6.3.6

% a.)

pend([0 10],[0 0], 100)

% b.)

pend([0 10],[pi 0], 100)

% c.)

pend([0 10],[4.65 0],100)
figure
