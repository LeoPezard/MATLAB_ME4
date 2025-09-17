clear all
clc
close all

% Question 1

% Define the function
f = @(x) x^3 + 2*x^2 + 10*x - 20;

% Use fzero to find the root, providing an initial guess
initial_guess = 1; % A reasonable guess based on the function behavior
root = fzero(f, initial_guess);

% Display the result
fprintf('La racine réelle de l equation est : %.4f\n', root);

% Question 2

% méthode des trapèzes

% Define the range for integration
x = linspace(-1, 2, 100); % 100 points from -1 to 2

F = 1./(4+x); % Fonction a intégrer

I = trapz(x,F,2); %sollution en utilisant la methode des trapz


%méthode normale
 
% Calculate the integral using the integral function
Sf = integral(@(x) 1 ./ (4 + x), -1, 2);

% Display the result
fprintf('L''intégrale calculée avec la méthode integral est : %.4f\n', Sf);

% méthode de Simpson

% Define the number of intervals (must be even for Simpson's rule)
n = 100; % Number of intervals
h = (2 - (-1)) / n; % Step size

% Create the x values for Simpson's rule
x_simpson = linspace(-1, 2, n + 1); % n + 1 points

% Calculate the function values at the x points
F_simpson = 1 ./ (4 + x_simpson);

% Apply Simpson's rule
I_simpson = (h/3) * (F_simpson(1) + 4 * sum(F_simpson(2:2:end-1)) + 2 * sum(F_simpson(3:2:end-2)) + F_simpson(end));

% Display the result
fprintf('L''intégrale calculée avec la méthode de Simpson est : %.4f\n', I_simpson);