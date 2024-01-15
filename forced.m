clear; clc; close all;
%% 

syms x t A_n B_n
L = 1000;
b = 50;
tickness = 1*10;
A = tickness*b;
E= 1699;
I = (b*tickness^3)/12;
rho = 2330; % kg/m3

mode_shapes_num = 3;


deflection = sym(0);
for n=1:mode_shapes_num
    beta_n = ((2*n-1)*pi)/(2*L);
    Omega_n = ((beta_n*L)^2)*((E*I)/(rho*A*L^4))^0.5;
    A_n = sym(['A_' num2str(n)]);
    % B_n = sym(['B_' num2str(n)]);
    B_n = 0;
    
    t = 1;
    force = 50/(sin(2*x)+cos(5*t)+cosh(10*t))^2

    W_n = (cos(beta_n*x) - cosh(beta_n*x)) - ...
    ((cos(beta_n*L) + cosh(beta_n*L)) / (sin(beta_n*L) + sinh(beta_n*L))) * ...
    (sin(beta_n*x) - sinh(beta_n*x));

    W_dot_F = @(x) ((cos(beta_n.*x) - cosh(beta_n.*x)) - ...
    ((cos(beta_n.*L) + cosh(beta_n.*L)) / (sin(beta_n*L) + sinh(beta_n.*L))) * ...
    (sin(beta_n.*x) - sinh(beta_n.*x))).*(50./(sin(2*x)+cos(5*t)+cosh(10*t)).^2);

    Q_i = integral(W_dot_F, 0, 100)

    deflection = deflection + ...
        vpa(W_n_calculator(beta_n)*(A_n*cos(Omega_n*t)+B_n*sin(Omega_n*t)));
end