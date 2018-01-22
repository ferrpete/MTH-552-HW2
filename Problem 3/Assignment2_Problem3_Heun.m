% Assignment2_Problem3_Heun.m
% Peter Ferrero, Oregon State University, 1/21/2018
% Implementation of Problem 3 from Assignment 2 for MTH 552.  Involves
% implementing the Heun method to solve a first-order ODE.

function [error] = Assignment2_Problem3_Heun(k)

tau = 1;
T = 5*tau;
h = T/k;
tstep = [0:h:T]';
n = length(tstep);
uh = zeros(n,1);
uh(1) = 0;

for i=2:n
    
    rhs1 = rhs_nonsmooth(tstep(i-1), tau);
    ustar = uh(i-1) + h*rhs1;
    uh(i) = uh(i-1) + (h/2)*(rhs1 + rhs_nonsmooth(tstep(i), tau));
    
end

tplot = [0:0.01:T]';
uplot = 0.25.*sawtooth(2*pi*tplot, 0.5)+0.25;
uexact = 0.25.*sawtooth(2*pi*tstep, 0.5)+0.25;

figure(1)
plot(tstep, uh, 'k-', tplot, uplot, 'r--')

error = norm(uexact-uh,inf);

end