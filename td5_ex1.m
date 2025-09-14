clear;
close all;
clc;

% 1) Finding the real root of the equation f(x) = x^3 + 2*x^2 + 10*x - 20
f = @(x) x^3 + 2*x^2 + 10*x - 20;
root = fzero(f, 1); % Initial guess is 1
disp(['Real root: ', num2str(root)]);

% 2) Calculating the integral using different methods
% Define the function for integration
integrand = @(x) 1 ./ (4 + x);

% Using MATLAB's integral function
S_integral = integral(integrand, -1, 2);
disp(['Integral using integral function: ', num2str(S_integral)]);

% Using trapezoidal method
n = 1000; % Number of intervals
x_trap = linspace(-1, 2, n);
y_trap = integrand(x_trap);
S_trap = trapz(x_trap, y_trap);
disp(['Integral using trapezoidal method: ', num2str(S_trap)]);

% Using Simpson's method
function S_simpson = simpsons(f, a, b, n)
    if mod(n, 2) == 1
        n = n + 1; % Ensure n is even
    end
    h = (b - a) / n;
    x = a:h:b;
    y = f(x);
    S_simpson = (h/3) * (y(1) + 4*sum(y(2:2:end-1)) + 2*sum(y(3:2:end-2)) + y(end));
end

S_simpson = simpsons(integrand, -1, 2, n);
disp(['Integral using Simpson''s method: ', num2str(S_simpson)]);

% 3) (Optional) Solving the differential equation using Runge-Kutta method
tspan = [1 2];
f0 = 1; % Initial condition
odefun = @(t, f) t * f^(1/3);
[t, f] = ode45(odefun, tspan, f0);
disp('Solution of the differential equation:');
disp([t, f]);