% Given data points
x = [1, 2, 3, 4, 5]; % Example data
y = [10, 15, 33, -4, 13]; % Example data

% Choose the type of fit, e.g., 'linear', 'polynomial', 'rat05' (rational), etc.
fitType = 'poly4'; % for a quadratic polynomial

% Create the fit
[fitresult, gof] = fit(x(:), y(:), fitType);

% Plot the fit
plot(fitresult, x, y);

% Annotate the plot
legend('Data Points', 'Fitted Curve');
xlabel('x');
ylabel('f(x)');
title('Curve Fitting to Data');