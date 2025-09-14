clear
close all
clc
set(0,'DefaultFigureRenderer','opengl');

a = 1;

% Système d'équations
odefun = @(t, z) [ ...
    a*cos(t.^2);  % dx/dt = -y
     a*sin(t.^2)   % dy/dt = x
];

% conditions initiales
z0 = [5; 25];
t0 = -2*pi;
% Time span (solution recherchée entre 0 et 5)
tspan = linspace(t0,2*pi,100);

% Solution avec ode23
[t, Y] = ode23(odefun, tspan, z0);
disp(size(t));
disp(size(Y));

% Affichage des résultats

figure;
hold on;

plot(x, y, 'm.-', 'LineWidth',1.5, 'MarkerSize',8);
grid on; axis equal;
xlabel('x(t)'); ylabel('y(t)'); title('Trajectoire (x(t), y(t))');