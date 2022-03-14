clear
clc;
close all;


h = transpose(logspace(-16, 0));

% Find the derivative of sin(x) at x = 0.5
for k = 1 : length(h)
    true_value = fdot(0.5);
    jac1 = numeric_jacobian(@f, 0.5, h(k));
    jac2 = numeric_jacobian2(@f, 0.5, h(k));
    jac3 = numeric_jacobian3(@f, 0.5, h(k));
    
    relerr(k,:) = [abs((jac1-true_value)/true_value) ...
                   abs((jac2-true_value)/true_value) ...
                   abs((jac3-true_value)/true_value)];
end

figure
hold on
plot(h,relerr(:,1),'b*',h,relerr(:,2),'ro',h,relerr(:,3),'gd');
set(gca, 'XScale', 'log')
set(gca, 'YScale', 'log')
xlim([1e-16 1])
legend('FDM', 'CSDA', 'CFDM', 'location', 'best')
title ('Relative erorrs: finding derivative of $f(x)=sin(x)$ at $x=0.5$', 'Interpreter','latex')
xlabel('Perturbation Steps', 'Interpreter','latex')
ylabel('Relative errors', 'Interpreter','latex')

%%
function y = f(x)
y = sin(x);
end

%%
function y = fdot(x)
y = cos(x);
end