% Problem1_rhs.m
% Peter Ferrero, Oregon State University, 1/21/2018
% Defines the right-hand side of the ODE for Assignment 2, Problem 1.

function [rhs] = Problem1_rhs(tstep, u)

    rhs = -tstep*u;

end