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

    deflection = deflection + ...
        vpa(W_n_calculator(beta_n)*(A_n*cos(Omega_n*t)+B_n*sin(Omega_n*t)))
end

%% 

% Initial point locations
x0 = [250 700 1000];




deflection_1 = subs(deflection, [x,t], [250,0] );
deflection_2 = subs(deflection, [x,t],[700,0]);
deflection_3 = subs(deflection, [x,t] ,[1000,0] );

eqn1 = deflection_1 == 5;
eqn2 = deflection_2 == 25;
eqn3 = deflection_3 == 50;


sol = solve([eqn1, eqn2, eqn3]);

syms A_1 A_2 A_3
y = subs(deflection, [A_1, A_2, A_3],[-30, 0.789438, -0.9801]);

% Define the parameters and ranges
xx = linspace(0, 10000000, 500); % 500 points between 0 and 1000
tt = linspace(0, 10, 200);   % 200 points between 0 and 10


subs(y,[x,t],[1000,20000000])

%% 


% Define the time duration and time step
t_duration = 1000000000;  % duration of 1 second
dt = 1000;       % time step in seconds

% Define the range of x values

% Define the figure
figure;

x_range = linspace(0, 1000, 100); % This creates a vector of 100 values between -10 and 10
time_range = linspace(0, 20000000, 5000);




for i = 1:length(time_range)
    % Plot the function
    y_vals = subs(y, {x, t}, {x_range, time_range(i)});
    y_numeric = double(y_vals);

    plot(x_range, y_numeric);
    axis([0, 1000, -50, 50]); % Set the limits for both x and y axes

    % axis tight;
    xlabel('x');
    ylabel('y');
    title(['Time: ' num2str(time_range(i)/5000) ' seconds']);
    grid on
    % Update the figure
    drawnow;
    disp(time_range(i))
    % Pause for the time step duration
    pause(0.1);
 
end
