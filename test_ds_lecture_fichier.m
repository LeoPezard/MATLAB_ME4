% Lire les données du fichier Excel
close all;
clear;
clc;

data = readtable('donnees.txt');

% Extraire les colonnes dans les variables x et signal
x = data{:, 1};      % 1ère colonne
signal = data{:, 2}; % 2ème colonne

% Créer la figure pour représenter signal en fonction de x
figure;
plot(x, signal);
xlabel('Position (m)');
ylabel('Vitesse (m/s)');
title('Vitesse en fonction de la position');
grid on;

mask = x > 0;
x_fit = x(mask);
y_fit = signal(mask);

% Transformation : X = log(x)
X = log(x_fit);

% Ajustement linéaire y = a*X + b
p = polyfit(X, y_fit, 1);  % p(1) = a, p(2) = b

a = p(1);
b = p(2);
disp(a);
disp(b);


Q = trapz(x,signal); % M�thode des trap�zes
Q