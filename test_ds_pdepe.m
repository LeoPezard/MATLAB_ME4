clear;
clc;
close all;

mu = 0.84;
rho = 916;
L = 0.1;
Vp = 3; % m/sec

m = 0; %pdepe


pdefun = @(y,t,u,DuDy) deal(1, (mu/rho)*DuDy, 0);  % [c,f,s]

cond_init = @(y) 0; % en y = 0 la plaque reste immobile

% Conditions aux limites 
cond_limit = @(yl,ul,yr,ur,t) deal(ul-0,0, ur-Vp,0);

% Discrétisation
y = linspace(0,L,50);
t = [0 0.5 1 3 6];  % temps à tracer

sol = pdepe(m,pdefun, cond_init, cond_limit, y,t);
u = sol(:,:,1);

figure;
plot(y,u(2,:),'b','LineWidth',2); hold on;
plot(y,u(3,:),'r','LineWidth',2);
plot(y,u(4,:),'g','LineWidth',2);
plot(y,u(5,:),'m','LineWidth',2);
xlabel('y [m]'); ylabel('u(y,t) [m/s]');
legend('t=0.5 s','t=1 s','t=3 s','t=6 s');
grid on; title('Vitesse dans l''huile d''olive en fonction de y');

figure;
plot(t,u(2,:),'b','LineWidth',2); hold on;
plot(t,u(3,:),'r','LineWidth',2);
plot(t,u(4,:),'g','LineWidth',2);
plot(t,u(5,:),'m','LineWidth',2);