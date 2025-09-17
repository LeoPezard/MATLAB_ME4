 clear
close all
clc


% Système d'équations
odefun = @(t, w) [ ...
    10*(w(2)-w(1));  % dx/dt = 10(y(t)-x(t))
    28*w(1)-w(2)-w(1)*w(3);   % dy/dt = 28x(t)-y(t)-x(t)z(t)
    w(1)*w(2)-w(3)*8/3; %dz/dt = x(t)y(t) -8/3 * z(t)
];

w0 = [1;1;1]; % solutions initiales x(0), y(0), z(0)

tspan = linspace(0,30,750);

[Time, w_sol] = ode23(odefun,tspan,w0);

figure;
comet3(w_sol(:,1), w_sol(:,2), w_sol(:,3)); % on voit la courbe se tracer 
% petit a petit
%plot3(w_sol(:,1), w_sol(:,2), w_sol(:,3)); % trace directement la courbe

xlabel('x(t)');
ylabel('y(t)');
zlabel('z(t)');
title('Trajectoire du système Lorenz animée avec comet3');
grid on;