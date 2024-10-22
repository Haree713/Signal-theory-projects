% Load the data from SinusInNoise1.mat
load('SinusInNoise1.mat');

% Define the sampling frequency
fs = 1000; % Replace with your actual sampling frequency

% Compute the periodogram for the signal
[Pxx, frequencies] = periodogram(y1, [], [], fs);

% Create a figure with customized appearance
figure;
set(gcf, 'Color', 'w'); % Set background color to white
ax = gca;
ax.FontSize = 12; % Increase font size for readability
ax.LineWidth = 1.5; % Increase line width for better visibility

% Plot the periodogram with customized aesthetics
plot(frequencies / fs, Pxx, 'b', 'LineWidth', 2);
xlim([0, 0.25]); % Set the x-axis range to [0, 0.4]
ylim([0, 0.012]); % Set the y-axis range to [0, 0.4]
xlabel('Normalized Frequency');
ylabel('Power/Frequency');
title('Periodogram of y0(n)');
grid on; % Add grid lines for clarity

% Customize the appearance of the title and labels
title('Periodogram of y0(n)', 'FontSize', 16, 'FontWeight', 'bold');
xlabel('Normalized Frequency', 'FontSize', 14, 'FontWeight', 'bold');
ylabel('Power/Frequency', 'FontSize', 14, 'FontWeight', 'bold');

% Customize the appearance of the legend (if needed)
% legend('Signal 1', 'Signal 2', 'Location', 'Best', 'FontSize', 12);

% You can save the plot as an image (optional)
% saveas(gcf, 'periodogram_plot.png');

% You can also export the plot to a PDF (optional)
% print(gcf, 'periodogram_plot.pdf', '-dpdf');

