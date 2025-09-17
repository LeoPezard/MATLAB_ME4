% TD n�5 Matlab : Lecture Sauvegarde et Analyse de donn�es
% Exercice 1: Analyse de donn�es
clear; close all; clc;
%
% Question 1) Trouver la racine r�elle de l��quation suivante : f(x)=x^3+2x^2+10x-20
display('TD n�5, Exercice 2=1: Question 1)')
x0=fzero('function1',1);
display(sprintf('La racine r�elle de l��quation suivante : f(x)=x^3+2x^2+10x-20 est x0=%f',x0));
display(' ')
%
% Question 2)
display('TD n�5, Exercice 1: Question 2)')
fun = @(x) 1./(4+x);
I=integral(fun,-1,2);
display(sprintf('En utilisant integral : S_f=%f',I));
%
X=linspace(-1,2,100);
Y=1./(4+X);
Q = trapz(X,Y); % M�thode des trap�zes
display(sprintf('En utilisant trapz : S_f=%f',Q));
display(' ')
%
% Question 3)
%EDO
% df/dt=g(t,f(t))=tf^(1/3)
display('TD n�5, Exercice 1: Question 3)')
fsol= @(t) (t.^2/3 + 2/3)^(3/2);

display(sprintf('Solution exacte de l''EDO en t=2                : f(2)=%f',fsol(2)));
%
[T1,y1]=ode23('exo_ode',[1 2],[1]); 
display(sprintf('Solution num�rique de l''EDO avec ode23 en t=2  : f(2)=%f',y1(end)));
%
[T2,y2]=ode45('exo_ode',[1 2],[1]);
display(sprintf('Solution num�rique de l''EDO avec ode45 en t=2  : f(2)=%f',y2(end)));