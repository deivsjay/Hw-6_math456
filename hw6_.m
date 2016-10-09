%------------------------------------------------------------------------
% Nicholas Rase
% MATH 456
% Homework 6 Computer Problems / Exercise 6.3-4
% Due April 6th, 2016
%
% NOTE: The final problem is exercise 6.3-4. With Dr. Harlim's
%       permission, I have utilized Matlab to solve that problem.
%------------------------------------------------------------------------

clear;
clc;
warning('off','all');

%------------------------------------------------------------------------
% Problem 6.3-6 CP
% FUNCTIONS: pendulum.m
%            tstep.m
%            IVP1.m

disp('[6.3-6]')
disp('Part A')
disp('Pendulum with [0,0]')
pendulum([0 10],[0 0], 100)

disp('Part B')
disp('Pendulum with [pi,0]')
pendulum([0 10],[pi 0], 100)

disp('Part C')
disp('Pendulum with [3.1,0]')
pendulum([0 10],[3.1 0],100)
figure

%------------------------------------------------------------------------
%------------------------------------------------------------------------
% Problem 6.4-10 CP
% FUNCTIONS: hodgkin_huxley.m
%            runge_kutta.m
%            IVP2.m
% (a)
disp('[6.4-10]')
disp('Part A')
disp('Inputs: [50 51 6.9216]')
hodgkin_huxley([0,100],[-65,0,0.3,0.6],2000,[50 51 6.9216]);
figure 

% (b)
disp('Part B')
disp('Inputs: [50 55 2.352]')
hodgkin_huxley([0,100],[-65,0,0.3,0.6],2000,[50 55 2.352]);
figure

% (c)
disp('Part C')
disp('Inputs: [50 55 4.704]')
hodgkin_huxley([0,100],[-65,0,0.3,0.6],2000,[50 55 4.704]);
figure
disp('Inputs: [50 60 2.352]')
hodgkin_huxley([0,100],[-65,0,0.3,0.6],2000,[50 60 2.352]);
figure

% (d)
disp('Part D')
disp('Inputs: [50 60 2]')
hodgkin_huxley([0,100],[-65,0,0.3,0.6],2000,[50 60 2]);
figure
disp('Inputs: [50 60 5]')
hodgkin_huxley([0,100],[-65,0,0.3,0.6],2000,[50 60 5]);
figure
disp('Inputs: [50 60 7]')
hodgkin_huxley([0,100],[-65,0,0.3,0.6],2000,[50 60 9]);
figure
disp('Inputs: [50 60 7]')
hodgkin_huxley([0,100],[-65,0,0.3,0.6],2000,[50 60 9]);
figure
%------------------------------------------------------------------------
%------------------------------------------------------------------------
% Problem 6.5-4 CP
% FUNCTIONS: N/A
% (a)
disp('[6.5-4]')
tol = 1e-8;
opts = odeset('RelTol',tol);
[t,y] = ode45(@(t,y)t,[0 1],1,opts);
length(t);
disp(' Part A')
disp('------------------------')
disp(['       t','         y'])
disp('------------------------')
disp([t(length(t)) y(length(t))])

% (b)
tol = 1e-8;
opts = odeset('RelTol',tol);
[t,y] = ode45(@(t,y)(t^2)*y,[0 1],1,opts);
length(t);
disp(' Part B')
disp('------------------------')
disp(['       t','         y'])
disp('------------------------')
disp([t(length(t)) y(length(t))])

% (c)
tol = 1e-8;
opts = odeset('RelTol',tol);
[t,y] = ode45(@(t,y)2*(t + 1)*y,[0 1],1,opts);
length(t);
disp(' Part C')
disp('------------------------')
disp(['       t','         y'])
disp('------------------------')
disp([t(length(t)) y(length(t))])

% (d)
tol = 1e-8;
opts = odeset('RelTol',tol);
[t,y] = ode45(@(t,y)5*(t^4)*y,[0 1],1,opts);
length(t);
disp(' Part D')
disp('------------------------')
disp(['       t','         y'])
disp('------------------------')
disp([t(length(t)) y(length(t))])

% (e)
tol = 1e-8;
opts = odeset('RelTol',tol);
[t,y] = ode45(@(t,y)1/(y^2),[0 1],1,opts);
length(t);
disp(' Part E')
disp('------------------------')
disp(['       t','         y'])
disp('------------------------')
disp([t(length(t)) y(length(t))])

% (f)
tol = 1e-8;
opts = odeset('RelTol',tol);
[t,y] = ode45(@(t,y)(t^3)/(y^2),[0 1],1,opts);
length(t);
disp(' Part F')
disp('------------------------')
disp(['       t','         y'])
disp('------------------------')
disp([t(length(t)) y(length(t))])

%------------------------------------------------------------------------
%------------------------------------------------------------------------
% Problem 6.6-2 CP
% FUNCTIONS: beuler_approx.m
%            beuler_compare.m
%            estep.m
%            IVP8.m
%            IVP9.m
% (a)
disp('[6.6-2]')
disp('Part A')
f = @(t,y)6*y - 3*y^2;
df = @(t,y)6 - 6*y;
beuler_approx(f,df,[0 20],0.5,20);
figure
beuler_compare(f,df,[0 1],0.5,10,8);
figure

% (b)
disp('Part B')
f = @(t,y)10*y^3 - 10*y^4;
df = @(t,y)6 - 12*y;
beuler_approx(f,df,[0 20],0.5,20);
figure
beuler_compare(f,df,[0 1],0.5,10,9);
figure

%------------------------------------------------------------------------
%------------------------------------------------------------------------
% Problem 6.7-6 CP
% FUNCTIONS: multistep.m
%            tstep.m
%            IVP3.m
% (a)
disp('Part A')
disp('h = 0.1')
multistep([0,1],0,10,3,1)
figure
disp('h = 0.05')
multistep([0,1],0,20,3,2)
figure

% (b)
disp('Part B')
disp('h = 0.1')
multistep([0,1],-0.5,10,3,3)
figure
disp('h = 0.05')
multistep([0,1],-0.5,20,3,4)
figure

%------------------------------------------------------------------------
%------------------------------------------------------------------------
% Problem 6.7-10 CP
% FUNCTION: adams_bashforth.m
%           adams_moulton.m
%           IVP7.m
%           prediction_correction.m
prediction_correction([0 5],1,100,4,7);
figure
prediction_correction([0 5],1,100,4,8);
figure

%------------------------------------------------------------------------
%------------------------------------------------------------------------
% Problem 6.3-4 E
% FUNCTIONS: euler_trap.m
%            tstep.m
%            IVP4.m
%            IVP5.m
%            IVP6.m
% (a)
disp('Part A')
[t y] = euler_trap([0 1],[1 1],4,4);
figure

% (b)
disp('Part B')
[t y] = euler_trap([0 1],[1 1],4,5);
figure 

% (b)
disp('Part C')
[t y] = euler_trap([0 1],[1 1],4,6);

%------------------------------------------------------------------------
% placed for convenience
%}
