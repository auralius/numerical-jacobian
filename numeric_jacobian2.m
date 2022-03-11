function jac = numeric_jacobian2(f, x, epsilon)
% Calculate Jacobian of function f at given x
% Complex-Step Derivative Approximation (CSDA) Method
%
% Inputs:
%   x is where the jacobian is being evaluated, it a row or column vector 
%   f can be a vector of function, but make sure it is a row vector (mx1)
%   epsilon is a very small number
%

if nargin < 3
    epsilon = 1e-5; 
end

epsilon_inv = 1/epsilon;

nx = length(x); % Dimension of the input x;

% Do perturbation
for k = 1 : nx
    xplus = x;
    xplus(k) =  x(k) + 1i*epsilon;
    jac(:, k) = imag(feval(f, xplus))  .* epsilon_inv;
end

    



