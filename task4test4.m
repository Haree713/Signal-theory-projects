% Load the data from SinusInNoise1.mat
load('SinusInNoise1.mat');

% Define the sampling frequency
fs = 200; % Replace with your actual sampling frequency

% Compute the periodogram for the signal
[Pxx, frequencies] = periodogram(y2, [], [], fs);

% Compute the periodogram for y(n)
[Pxx_y, frequencies] = periodogram(y, [], [], fs);

% Plot the periodogram with customized aesthetics
plot(frequencies / fs, Pxx, 'b', 'LineWidth', 2);
xlim([0, 0.3]); % Set the x-axis range to [0, 0.4]
ylim([0, 0.3]); % Set the y-axis range to [0, 0.4]
xlabel('Normalized Frequency');
ylabel('Power/Frequency');
title('Periodogram of y1(n) imposed over y(n)');
grid on; % Add grid lines for clarity

hold on;

% Plot the periodogram for y1(n) (H1) on top of y(n)
plot(frequencies / fs, Pxx_y, 'r', 'LineWidth', 2);

hold off;

% Customize the appearance of the plot
legend({'Periodogram of y1(n)', 'Periodogram of y(n)'}, 'FontSize', 12);
grid on;
