clear
close all
clc

L = 0.5;
m=0;

tspan = linspace(0,1000,6);
xspan = linspace(0,0.5,40);

k = 80.2;
rho = 7870;
Cp = 447;

pdexlic = @(x)[200];

% Pour pouvoir utiliser les coefficients k, rho et Cp dans la fonction
% pdex1pde dans l'autre fichier
pdefun = @(x,t,u,DuDx) pdex1pde(x,t,u,DuDx,k,rho,Cp);

sol = pdepe(m,pdefun,pdexlic,@pdex1bc, xspan, tspan);

% 
figure;
hold on;
for i = 1:length(tspan)
    u=sol(i,:,1)
    plot(xspan,u,'DisplayName', [' t =', num2str(tspan(i)),' sec']);
end
legend show;
xlabel('x (m)');
ylabel('T(x,t)');
title('Évolution de T(x,t) dans le temps');

figure;
u_2 = sol(:,:,1);
surf(xspan, tspan,u_2);