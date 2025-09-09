function [c,f,s] = pdex1pde(x,t,u,DuDx, k, rho, Cp)
alpha = k/(rho*Cp);
c= 1/alpha; 
f= DuDx; 
s= 0;
end