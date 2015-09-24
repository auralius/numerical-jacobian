function demo()
    jac1 = numeric_jacobian(@test_func1, [1 1])
    jac2 = numeric_jacobian(@test_func2, [1 1])
    jac3 = numeric_jacobian(@test_func3, [0 1 1])
end

function y = test_func1(x)
y = x(1)^2 + x(2)^2;
end

function y=test_func2(x)
    % See http://www.maths.lth.se/na/courses/FMN081/FMN081-06/lecture7.pdf
    % Section 3.6
    y = [x(1)^2 * x(2)^2 - 1;
         5*x(1)^2 + 21*x(2)^2 - 9];         
end

function y=test_func3(x)
    % See http://youngmok.com/numerical-jacobian-matrix-matlab/
    y=[x(2)*x(3);
       -x(1)*x(3);
       -0.51*x(1)*x(3)];
end