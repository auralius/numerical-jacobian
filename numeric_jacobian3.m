function jac = numeric_jacobian3(f, x, epsilon)
% Calculate Jacobian of function f at given x
% Central Finite Difference Method (CFDM)
%
% Inputs:
%   f can be a vector of function, but make sure it is a row vector
%   x is where the jacobian is being evaluated, it a row or column vector 
%   epsilon is a very small number

if nargin < 3
    epsilon = 1e-5; 
end

epsilon_inv = 1/epsilon;

nx = length(x); % Dimension of the input x;

% Do perturbation
for i = 1 : nx
    xplus = x;
    xminus = x;
    xplus(i) =  x(i) + epsilon;
    xminus(i) =  x(i) - epsilon;
    jac(:, i) = 0.5 * epsilon_inv * (feval(f, xplus) - feval(f, xminus));
end
end

    



