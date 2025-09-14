% PDE parabolique corrigée pour pdepe
clear; close all; clc

m = 0;                      % géométrie cartésienne
x = linspace(0,1,100);      % maillage spatial
t = linspace(0,60,200);     % maillage temporel (contient 0,5,10,60)

% résolution
sol = pdepe(m,@pdefun,@icfun,@bcfun,x,t);
u = sol(:,:,1);  % u(t_i, x_j)

%% Figure 1 : C(x) pour t = 0, 5, 10, 60 s
tvals = [0 5 10 60];
figure; hold on;
for j = 1:length(tvals)
    [~,it] = min(abs(t - tvals(j)));
    plot(x, u(it,:), '-','LineWidth',1.4,'DisplayName',sprintf('t = %g s', t(it)));
end
xlabel('x (m)'); ylabel('C(x,t)');
legend('Location','best'); grid on;
title('C(x,t) en fonction de x pour t = 0,5,10,60 s');

%% Figure 2 : C(t) pour x = 0, 0.10, 0.55, 0.75, 1 m
xpos = [0 0.10 0.55 0.75 1];
figure; hold on;
for k = 1:length(xpos)
    Cxt = zeros(size(t));
    for ii = 1:length(t)
        % interpolation spatiale à chaque instant
        Cxt(ii) = interp1(x, u(ii,:), xpos(k));
    end
    plot(t, Cxt, 'DisplayName', sprintf('x = %.2f m', xpos(k)), 'LineWidth',1.2);
end
xlabel('t (s)'); ylabel('C(x,t)');
legend('Location','best'); grid on;
title('C(x,t) en fonction du temps pour positions fixes');

%% fonctions (peuvent rester imbriquées ou dans des fichiers séparés)
function [c,f,s] = pdefun(x,t,u,DuDx)
    % Remarque : log(t+2) (et non log(t)+2)
    c = (x .* log(t + 2)) / 10;        % coefficient devant u_t
    f = 1e-3 * DuDx;                   % flux -> d/dx(f) = 1e-3 * u_xx
    s = (-0.01 * tan(x)) .* DuDx;      % terme source dépendant de u_x
end

function u0 = icfun(x)
    u0 = 10 * cos(x);                 % C(x,0)
end

function [pl,ql,pr,qr] = bcfun(xl,ul,xr,ur,t)
    % gauche : Dirichlet C(0,t) = 10
    pl = ul - 10;
    ql = 0;
    % droite : dC/dx(1,t) = -1e-5 * exp(-t)
    % f = 1e-3 * u_x  =>  f_desired = 1e-3 * (-1e-5*exp(-t)) = -1e-8*exp(-t)
    % pdepe requires pr + qr * f = 0  => on choisit qr = 1 et pr = -f_desired
    pr = 1e-8 * exp(-t);
    qr = 1;
end

