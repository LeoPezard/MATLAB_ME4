function q = energy(lambda, T, c, h, k)
    q = (2*pi*c^2*h)./(((lambda*10^-6).^5) .* exp(c*h./(lambda*10^-6*k*T)));
end