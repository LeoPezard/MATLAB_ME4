clear
close all
clc

L = 0.5;
l = 0.03;
e = 0.001;
Tair = 29;
T0 = 53;

U = 5.3;

h = 62;
k = 390;
S = l*e;
P = 2*l+2*e;

xspan = linspace(0,0.5,40);

sol_init = bvpinit([0 L],[T0 0]);
sol_init.x
sol_init.y

odefun = @(x, T)[
    T(2);
    1/(k*S) * (h*P*(T(1)-Tair))];
bcfun = @(Ta,Tb) [Ta(1)-T0;Tb(2)];

sol = bvp4c(odefun,bcfun,sol_init);

figure;
plot(sol.x, sol.y(1,:)-Tair, 'b-*');
xlabel('x (m)');
ylabel('T (°C)');
grid on;

X=sol.y(1,:);
Y=h*P*(X-Tair);
Q = trapz(sol.x,Y); % M�thode des trap�zes
display(Q);