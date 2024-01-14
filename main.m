clear; 
clc
syms x t A_n B_n
L = 1000;
b = 50;
tickness = 1;
A = t*b;
E= 169; 
I = (b*tickness^3)/12;
rho = 2330; % kg/m3

mode_shapes_num = 5;

deflection = 0;
for n=1:mode_shapes_num
    beta_n = (2*n-1)*pi/(2*L);
    W_n_calculator(beta_n);
    Omega_n = ((beta_n*L)^2)*(E*I/(rho*A*L^4))^0.5;
    deflection = deflection + vpa(W_n_calculator(beta_n)*(A_n*cos(Omega_n*t)+B_n*sin(Omega_n*t)))
end