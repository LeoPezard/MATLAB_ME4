function Y=exo_ode(t,X)

Y=zeros(1,1);
Y(1)=t*X(1)^(1/3);

end