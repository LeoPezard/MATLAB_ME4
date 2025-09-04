clc
l = [1 2 3 4 5];
v = [1;2;3;4;5];
A = [1 2 0 0 0; 0 0 2 3 1; 0 0 0 2 2;0 0 0 0 1; 1 1 1 0 0];
B = [1 2 3 4 5; 2 3 4 5 6; 3 4 5 6 7; 4 5 6 7 8; 5 6 7 8 9];

fprintf("Matrice A:");
A
fprintf("Matrice B:");
B
fprintf("Produit de A et B:");
C = A*B;
C

fprintf("Extraction de la première ligne de A :");
D = A(1,:);
D

fprintf("Extraction de la deuxième colonne de A");
E = A(:,2);
E

fprintf("Sous matrice de A :"); % 1<=i<=3 1<=j<=5
F = A(:,[1 2 3]);
F

fprintf("Termes diagonaux de B"); %fonction diag existe
G = diag(B);
G

fprintf("Taille de l :");
size_l = size(l);
disp(size_l);

fprintf("Taille de v :");
size_v = size(v);
disp(size_v);

fprintf("Taille de A :");
size_A = size(A);
disp(size_A);

fprintf("Taille de B :");
size_B = size(B);
disp(size_B);