clear all
clc
close all


filename = 'mesures_h_plaque_plane.xlsx'; % Specify the name of the .xlsx file
% data = readtable(filename); % Read the .xlsx file into a table
% 
% disp(data);% Afficher les données lues


% Obtenir la liste des feuilles
[~, nomsFeuilles] = xlsfinfo(filename);

% Boucle sur chaque feuille
for i = 1:length(nomsFeuilles)
    nomFeuille = nomsFeuilles{i};
    %fprintf('Lecture de la feuille : %s\n', nomFeuille);

    % Lire la feuille
    data2 = readtable(filename, 'Sheet', nomFeuille);

    % Afficher un extrait des données
    disp(head(data2));  % head() affiche les premières lignes
end

%x = linspace(0,100,1000); % on cré une fonction qu'on connait pour y coller l'autre
%y = A*exp(x)+B ;

% on fit la série de point sachant qu'on connait déja l'expression

% Initialisation
figure;
hold on;
legendes = {};
vitesse = [8.5 1.5 2.7 0.9];


    v = 6.1;
    p = data2.p;
    U = data2.U;
    SdT = data2.sdT; % récupère les infos dans la table avec le titre de la colonne

   

    % Régression linéaire (1er degré)
    coeffs = polyfit(SdT, p, 1);  % coeffs(1) = pente = h

    % Évaluer la droite de régression
    SdT_fit = linspace(min(SdT), max(SdT), 100);
    p_fit = polyval(coeffs, SdT_fit);

    % Tracé des points expérimentaux
    plot(SdT, p, 'o', 'DisplayName', sprintf('v = %.1f m/s', v));

    % Tracé de la droite de régression
    plot(SdT_fit, p_fit, '-', 'DisplayName', ...
        sprintf('Régression v = %.1f m/s (h = %.2f W/m²K)', v, coeffs(1)));

    % Stocker la légende
    legendes{end+1} = sprintf('v = %.1f m/s', v);


% Mise en forme du graphe
xlabel('SΔT (m²·K)');
ylabel('Puissance p (W)');
title('Régression linéaire : p = h·SΔT pour différentes vitesses');
legend('show');
grid on;

% Sauvegarde de la figure
saveas(gcf, 'regression_convection.png');