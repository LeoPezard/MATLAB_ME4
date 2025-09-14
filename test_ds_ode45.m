clear
close all
clc

val_a = [1, 5, 10];
tspan = linspace(-pi, pi, 200);
z0 = [1; 0]; % x(-pi)=1 et y(-pi)=0

% solution avec ode45
figure;
hold on;
for i = 1:length(val_a)
    odefun = @(t, z) [ ...
        val_a(i)*(cos(t)+z(2));  % dx/dt = a(cos(t)+y(t))
        val_a(i)*(sin(t)-z(1))   % dy/dt = a(sin(t)-x(t))
];
    [T_ode45, Z_ode45] = ode45(odefun, tspan, z0);
    plot(Z_ode45(:,1), Z_ode45(:,2), 'DisplayName',['a =' num2str(val_a(i))]); % Plot y vs x
end
legend show;

hold off;
xlabel('Solution x');
ylabel('Solution y');
title('Solution of dx/dt = -y(t) and dy/dt = x(t) affichage de y(t) en fonction de x(t)');

