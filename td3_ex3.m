clear all
close all
clc

% Définitions des différents paramètres (différents deltas)
cases = [0.1; 1; 2];
w0 = 1;

% Temps échantillonné
tspan = linspace(0,50,100);

% Conditions initiales
z0 = [1; 0]; % y(0) = 1, dy/dt(0) = 0

figure;
hold on;

% calcul pour chaque cas (différents deltas)
for i = 1:length(cases)
    delta = cases(i);

    % Define the ODE as an anonymous function
    odefun = @(t, y) [y(2); -2*delta*y(2) - w0^2*y(1)];

    % Solve the ODE using ode23
    [t, Y] = ode23(odefun, tspan, z0);

    % Plot the results
    
    plot(t, Y(:, 1),'DisplayName',['Solution for \delta = ' num2str(delta)]);
    xlabel('Time t');
    ylabel('y(t)');
    legend show;
    grid on;
end
title(['Solution Y']);
hold off;

