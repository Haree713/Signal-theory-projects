% Define the parameters
alpha = 0.25;
beta = 0.25;
sigma_x_squared = 1;

% Define the range of v values
v = linspace(-0.5, 0.5, 1000); % Adjust the range as needed

% Define the angular frequency
omega = 2 * pi * v;

% Calculate RY(v) for each v
RY = sigma_x_squared ./ (1 + alpha^2 - 2 * alpha * cos(omega) .* (1 - beta * exp(-1j * omega)).^2);

% Plot RY(v)
figure;
plot(v, abs(RY));
xlabel('v');
ylabel('|RY(v)|');
title('Power Spectral Density R_x_2(v)');
grid on;