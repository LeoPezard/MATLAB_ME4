clear; close all; clc;

%% Paramètres
L = 0.5;       % longueur [m]
l = 0.03;      % largeur [m]
e = 0.001;     % épaisseur [m]
Tinf = 29;     % température de l'air [°C]
T0 = 53;       % température à x=0 [°C]

S = l*e;       % section de l'ailette
P = 2*(l+e);   % périmètre de l'ailette
h = 10;        % coefficient de convection [W/m²K] (à ajuster)
k = 200;       % conductivité thermique [W/mK] (à ajuster selon matériau)

%% Fonction ODE (système 1er ordre)
odefun = @(x,y) [y(2); (h*P/(S*k))*(y(1)-Tinf)];

%% Conditions aux limites
bcfun = @(ya,yb) [ya(1)-T0; yb(1)-Tinf];

%% Maillage initial
xinit = linspace(0,L,20);
solinit = bvpinit(xinit, [T0 0]); % initial guess: T=T0, dT/dx=0

%% Résolution BVP
sol = bvp4c(odefun, bcfun, solinit);

%% Extraction solution
x = linspace(0,L,100);
y = deval(sol,x);
T = y(1,:);
dTdx = y(2,:);

%% Tracés côte à côte
figure;

subplot(1,2,1);
plot(x, T-Tinf, 'r','LineWidth',2);
xlabel('x [m]'); ylabel('T(x)-T_\infty [°C]');
grid on; title('Température relative');

subplot(1,2,2);
plot(x, dTdx, 'b','LineWidth',2);
xlabel('x [m]'); ylabel('dT/dx [°C/m]');
grid on; title('Gradient de température');

% Calcul de la fonction à intégrer
f = h*P*(T-Tinf);  % vecteur de valeurs f(x)

% Intégrale par la méthode des trapèzes
Q = trapz(x, f);

% Affichage avec 4 chiffres après la virgule
fprintf('Flux total dissipé le long de l''ailette : %.4f W\n', Q);
