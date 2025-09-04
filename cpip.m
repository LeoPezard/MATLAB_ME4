function [cp,ip] = cpip(A,B,C,D,E,T)
    cp = A+B.*((C./T)./(sinh(C./T))).^2+D*((E./T)./(sinh(E./T))).^2;

    ip = A*T +(B*C)./tanh(C./T) - D*E./tanh(E./T);
end

