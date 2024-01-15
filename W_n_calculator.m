function Wn = W_n_calculator(beta_n)
L = 1000;

syms x
Wn = (cos(beta_n.*x) - cosh(beta_n.*x)) - ...
    ((cos(beta_n.*L) + cosh(beta_n.*L)) ./ (sin(beta_n.*L) + sinh(beta_n.*L))) .* ...
    (sin(beta_n.*x) - sinh(beta_n.*x));
end