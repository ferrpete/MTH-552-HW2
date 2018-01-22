% Assignment2_Problem1_Heun.m
% Peter Ferrero, Oregon State University, 1/21/2018
% Implementation of Problem 1 from Assignment 2 for MTH 552.  Involves
% implementing the Heun method to solve a first-order ODE.

function [error] = Assignment2_Problem1_Heun(h)

T = 4;
tstep = [0:h:T]';
n = length(tstep);
uh = zeros(n,1);
uh(1) = 1;

for i=2:n
    
    rhs1 = Problem1_rhs(tstep(i-1), uh(i-1));
    ustar = uh(i-1) + h*rhs1;
    uh(i) = uh(i-1) + (h/2)*(rhs1 + Problem1_rhs(tstep(i), ustar));
    
end

uexact = exp((-tstep.^2)./2);

figure(1)
plot(tstep, uh, 'k-', tstep, uexact, 'r--')

error = norm(uexact-uh,inf);

end