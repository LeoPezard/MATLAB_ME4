clear
close all
clc

L = 0.5;
l = 0.003;
e = 0.001;
Tair = 29;
T0 = 53;

S = l*e;
h = 62;
K = 390;
P = 2*l+2*e;
U = 5.3;

xspan = linspace(0,L,100);

sol_init = bvpinit([0, L], [T0,0]); 
sol_init.x
sol_init.y

odefun = @(x,T)[
    T(2);
    (h*P)/(K*S)*(T(1) - Tair)
    ];


bcfun = @(ya, yb) [ya(1)-T0; yb(1)-Tair];

sol = bvp4c(odefun,bcfun,sol_init);

x = sol.x;
y = sol.y;

figure;
subplot(2,1,1);
plot(sol.x, sol.y(1,:)-Tair, 'b-*');
xlabel('x (m)');
ylabel('T(x) - T_{air} (°C)');
title('Écart de température entre l''ailette et l''air');
grid on;

subplot(2,1,2);
plot(sol.x, sol.y(2,:), 'r:o');
xlabel('x (m)');
ylabel('dT/dx (°C/m)');
title('Gradient de température le long de l''ailette');
grid on;

% Fonction hp(T-Tair)
T = sol.y(1,:);
integrand = h*P*(T-Tair);
val = trapz(x,integrand);
disp(val);