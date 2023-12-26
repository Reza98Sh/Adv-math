% Define parameters and constants
L = 1; 
E = 1; 
I = 1; 
rho = 1; 
A = 1; 



% Initial conditions
y0 = [1; 1]; 

% Time span
tspan = [0, 10]; 


[t, y] = ode45(@(t, y) beamODE(t, y, L, E, I, rho, A), tspan, y0);

% Plot the results
figure;
plot(t, y(:,1))
title('Displacement vs. Time')
xlabel('Time (s)')
ylabel('Displacement (m)')

figure;
plot(t, y(:,2))
title('Velocity vs. Time')
xlabel('Time (s)')
ylabel('Velocity (m/s)')


function dydt = beamODE(t, y, L, E, I, rho, A)
    % y(1) is displacement, y(2) is velocity
    
    % Implement the actual ODEs here
    % dydt(1) = y(2);
    % dydt(2) = -E*I/(rho*A*L^4) * some_function_of_y_and_t;
    
    dydt = [y(2); -E*I/(rho*A*L^4) * y(1)]; 
end
