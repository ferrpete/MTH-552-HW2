% Problem2_rhs.m
% Peter Ferrero, Oregon State University, 1/21/2018
% Defines the right-hand side of the ODE for Assignment 2, Problem 2.

function [rhs] = Problem2_rhs(tstep, u)

    rhs = -tstep*(u^2);

end