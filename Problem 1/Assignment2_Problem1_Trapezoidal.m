% Assignment2_Problem1_Trapezoidal.m
% Peter Ferrero, Oregon State University, 1/21/2018
% Implementation of Problem 1 from Assignment 2 for MTH 552.  Involves
% implementing the Trapezoidal method to solve a first-order ODE.

function [error] = Assignment2_Problem1_Trapezoidal(h)

absTol = 1e-14;
T = 4;
tstep = [0:h:T]';
n = length(tstep);
uh = zeros(n,1);
uh(1) = 1;

for i=2:n
    
    rhs1 = Problem1_rhs(tstep(i-1), uh(i-1));
    ukNew = uh(i-1);
    ukOld = realmax;
    
    while abs(ukNew - ukOld) > absTol
        
        ukOld = ukNew;
        ukNew = uh(i-1) + (h/2)*(rhs1 + Problem1_rhs(tstep(i), ukOld));
        
    end
    
    uh(i) = ukNew;
    
end

uexact = exp((-tstep.^2)./2);

figure(1)
plot(tstep, uh, 'k-', tstep, uexact, 'r--')

error = norm(uexact-uh,inf);

end