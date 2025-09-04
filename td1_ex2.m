clc

v1 = [5 -3 6];
v2 = [1 2 3 4];
v3 = [1;2;3;4];

A1 = zeros(4, 4); % matrice de zéros
A1 = diag(v1,1); % remplacement de valeurs par celles de v1 (décalé de 1 à droite)
A1

A2 = zeros(4, 4);
A2 = diag(2*v1,-1); % pareil mais de 1 à gauche
A2

A3 = zeros(4,4);
A3 = diag(v3,0);
A3 = A3 + A1 +A2;
A3

fprintf("Taille de v1 :");
size_v1 = size(v1);
disp(size_v1);

fprintf("Taille de A3 :");
size_A3 = size(A3);
disp(size_A3);

fprintf("Calcul déterminant de A3 :");
det_A3 = det(A3);
det_A3

fprintf("Trace de A3 :");
tr_A3 = trace(A3);
tr_A3

fprintf("Produit de A2 et A3:");
C = A2*A3;
C

fprintf("Produit scalaire de v1 et v2 de trois manières différentes :");
D1 = dot(v1, v1);
D1
disp(D1); % disp( X ) displays the value of variable X without printing the variable name

D2 = sum(v1.*v1);
D2

D3 = v1*v1'; % Produit scalaire de v1 et v1 transposé
D3