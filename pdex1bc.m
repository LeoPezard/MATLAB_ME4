function [pl, ql, pr, qr] = pdex1bc(xl, ul, xr, ur, t)
    % À gauche : u(0,t) = 0
    pl = ul;      % impose u = 0
    ql = 0;

    % À droite : u(0.5,t) = 200
    pr = ur - 200;  % impose u = 200
    qr = 0;
end