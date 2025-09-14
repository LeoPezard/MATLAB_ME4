clear all
close all
clc

tspan = linspace(-pi, pi, 200);
z0 = [1; 0];
a = [ 1 5 10];

figure;
hold on;
for i =1:length(a)
    odefun = @(t,y)[
    a(i)*(cos(t)+y(2));
    a(i)*(sin(t)-y(1));
    ]
    [t,z] = ode45(odefun,tspan,z0);
    plot(z(:,1), z(:,2), 'DisplayName',['a =' num2str(a(i))]);
end

legend show;