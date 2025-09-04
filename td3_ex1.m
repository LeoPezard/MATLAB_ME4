clear
close all
clc


% Système d'équations
odefun = @(t, z) [ ...
    -z(2);  % dx/dt = -y
     z(1)   % dy/dt = x
];

% Ceci définit une fonction anonyme 'odefun' qui prend en entrée :
% t : le temps
% z : un vecteur de variables [x; y]
% La fonction retourne un vecteur colonne contenant :
% dx/dt = -y = -z(2)
% dy/dt = x = z(1)
% Car z = [x(t);y(t)] et z(1) = x(t) et z(2) = y(t)

% conditions initiales
z0 = [1; 0]; % x(0)=1 et y(0)=0

% Time span (solution recherchée entre 0 et 5)
tspan = [0,2*pi];

% Solution avec ode23
[T_ode23, Z_ode23] = ode23(odefun, tspan, z0);

% EXPLICATION 
% ode23 est un solveur numérique pour EDO basé sur une méthode de 
% Runge-Kutta d'ordre 2/3.
% 
% Elle résout numériquement les équations définies dans 'odefun' sur 
% l'intervalle tspan avec la condition initiale z0.
% 
% La sortie :
% % T_ode23 : un vecteur des temps auxquels la solution a été calculée.
% 
% Z_ode23 : une matrice où chaque ligne est [x(t_i), y(t_i)] 
% correspondant aux temps dans T_ode23.



% solution avec ode45
[T_ode45, Z_ode45] = ode45(odefun, tspan, z0);

% Solutions exactes intuitives(cosinus et sinus)
x_exact = cos(T_ode23);
y_exact = sin(T_ode23);

% Affichage des résultats
figure;
hold on;
plot(T_ode23, Z_ode23(:,1));%Z_ode23(:,1) est la solution x(t)
plot(T_ode23, x_exact, 'g*');
plot(T_ode23, Z_ode23(:,2));%Z_ode23(:,2) est la solution y(t)
plot(T_ode23, y_exact, 'b*');
hold off;
xlabel('Temps t');
ylabel('Valeurs');
legend('x numérique', 'x exact', 'y numérique', 'y exact'); % <<< Légende ici
title('Solution of dx/dt = -y(t) and dy/dt = x(t) with ode23');

figure;
plot(Z_ode23(:,1),Z_ode23(:,2));
xlabel('x(t)');
ylabel('y(t)');
legend('Solution numérique');
title('Solution of dx/dt = -y(t) and dy/dt = x(t) affichage de y(t) en fonction de x(t)');

figure;
hold on;
plot(T_ode45, Z_ode45(:,1));%Z_ode45(:,1) est la solution x(t)
plot(T_ode45, Z_ode45(:,2));%Z_ode45(:,2) est la solution y(t)
hold off;
title('Solution of dx/dt = -y(t) and dy/dt = x(t) with ode45');


