% Define the range of k values
k_values = 0:30;

% Calculate the corresponding normalized frequencies v
v = k_values / 30;

% Define the equation in the frequency domain for the specified v values
H = 1 ./ (abs(1 - 0.25 * exp(-1i * 2 * pi * v)).^2 .* (1 + 0.25^2 - 0.5 * cos(2 * pi * v)));

% Perform IFFT to obtain the time-domain signal h
h = ifft(H, 'symmetric');  % Use 'symmetric' option to get real values

% Set values beyond k = 20 to zero
k_max = 30;
h(k_values > k_max) = 0;

% Plot the time-domain signal with discrete values
figure;
stem(k_values, h, 'Marker', 'o', 'LineStyle', '-');
title('Autocorrelation Function r_{x2}');
xlabel('k');
ylabel('r_{x2}');
grid on;

