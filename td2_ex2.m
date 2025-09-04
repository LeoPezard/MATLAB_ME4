clc
close all

A=10;
B=1;
C=100;
D=1;
E=1000;

T = [250:250:3000];

figure;
hold on;
[cp, ip] = cpip(A,B,C,D,E,T);
plot(T,cp);
title('Cp depends on T');
xlabel('T (K)');
ylabel('Cp');
hold off;
figure;
plot(T,ip);
title('Ip depends on T');
xlabel('T (K)');
ylabel('Ip');
