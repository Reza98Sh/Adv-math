clear; clc; close all;
%% 

syms x t A_n B_n
L = 1000;
b = 50;
tickness = 1;
A = tickness*b;
E= 169;
I = (b*tickness^3)/12;
rho = 2330; % kg/m3

mode_shapes_num = 3;

deflection = sym(0);
for n=1:mode_shapes_num
    beta_n = (2*n-1)*pi/(2*L);
    W_n_calculator(beta_n);
    Omega_n = ((beta_n*L)^2)*(E*I/(rho*A*L^4))^0.5;
    A_n = sym(['A_' num2str(n)]);
    % B_n = sym(['B_' num2str(n)]);
    B_n = 0;

    deflection = deflection + ...
        vpa(W_n_calculator(beta_n)*(A_n*cos(Omega_n*t)+B_n*sin(Omega_n*t)));
end

%% 

% Initial point locations
x0 = [250 700 1000];

disp0 = [10 25 50];


deflection_1 = subs(deflection, [x,t], [250,0] )
deflection_2 = subs(deflection, [x,t],[700,0])
deflection_3 = subs(deflection, [x,t] ,[1000,0] )

eqn1 = deflection_1 == 10
eqn2 = deflection_2 == 25
eqn3 = deflection_3 == 50


sol = solve([eqn1, eqn2, eqn3]);

syms A_1 A_2 A_3
y = subs(deflection, [A_1, A_2, A_3],[-6040707580191682, 1442653227513044, -375244193078078])

% Define the parameters and ranges
x = linspace(0, 1000, 500); % 500 points between 0 and 1000
t = linspace(0, 10, 200);   % 200 points between 0 and 10



