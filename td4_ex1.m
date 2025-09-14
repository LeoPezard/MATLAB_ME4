clear
close all
clc


tspan = linspace(0,1,100);

% conditions aux limites y(0) = 0 et y(1) = 1
sol_init = bvpinit([0, 1], [0,1]); 
sol_init.x
sol_init.y

odefun = @(t,y)[y(2); 4*y(1)-3*y(2)];
bcfun = @(ya, yb) [ya(1); yb(1)-1]

sol = bvp4c(odefun,bcfun,sol_init)

x = sol.x;
y = sol.y;

plot(sol.x, sol.y(1,:), 'b-*', sol.x, sol.y(2,:), 'r:o');
legend('solution y', 'dérivée de y')
