clear
close all
clc

val_delta = [0.1 ; 1; 2];
w0 = 1;
initial_conditions = [1; 0]
tspan = linspace(0,30,750);

figure;
hold on;
for i = 1:length(val_delta)
    %différent delta à chaque itération
    delta = val_delta(i);
    % transformation du système
    % y(t) = y(1) et dy/dt = y(2) (vecteur y
    % dy(1)/dt = y(2) et dy(2)/dt = d²y(t)/dt = -w0²*y(1) - 2*delta*y(2)
    odefun = @(t,y)[y(2); -2*delta*y(2) - w0^2*y(1)];
    [Time, w_sol] = ode23(odefun, tspan, initial_conditions);
    
    plot(Time, w_sol(:,1), 'DisplayName', ['Reponse pour \delta = ' num2str(delta)])
    title('Réponse pour différents delta');
    xlabel('Temps');
    ylabel('y(t)');
    grid on;
end
legend show;