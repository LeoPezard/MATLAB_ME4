clc
close all

c = 3*10^8;
h = 6.62*10^-34;
k = 1.38*10^-23;

T = [1500 2000 2500 3000];
lambda = [0.25:0.01:3]; %début:pas:fin
lambda2 = linspace(0.25,3,1000);

% Function to calculate density
% La fonction energy existe dans energy.m et doit etre dans le meme
% repertoire
figure;
hold on; % Garder les courbes sur le meme graphe
for i = 1:length(T)
    q = energy(lambda, T(i), c, h, k); % appeler la fontion pour calculer 
    % la densité à chaque valeur de T
    plot(lambda, q, 'DisplayName', ['T = ' num2str(T(i)) ' K']); % ajout 
    % d'une légende pour chaque courbe
end

title('Density vs Wavelength for Different Temperatures using plot');
xlabel('Wavelength (µm)');
ylabel('Density (q)');
grid on;
legend show; % Show legend to identify different temperatures
hold off; % Release the hold on the current figure

% Avec fplot
figure;
hold on; % Hold on to plot all curves on the same graph
for i = 1:length(T)
    f = @(x) energy(x, T(i), c, h, k); % fonction anonyme qui 
    % dépend de x (=f(x) et retourne energy(...) en utilisant
    fplot(f, [0.25 3], 'DisplayName', ['T = ' num2str(T(i)) ' K']); 
    % f = fonction anonyme que j'ai définie
    %[0.25 3] : c'est l'intervalle (x) qui va etre utilisé
    %'DisplayName'ajouter un nom à la courbe, utilisé dans la légende.

    %fplot(@(lambda2) energy(lambda2, T(i), c, h, k), [0.25 3]); % marche aussi
end

title('Density vs Wavelength for Different Temperatures using fplot');
xlabel('Wavelength (µm)');
ylabel('Density (q)');
grid on;
legend show; % Show legend to identify different temperatures
hold off; % Release the hold on the current figure