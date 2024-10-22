% Load the data from SinusInNoise2.mat
load('SinusInNoise2.mat');

% Define signal parameters
fs = 1; % Sampling frequency (normalized)
v0 = 0.05;
v1 = 0.25;

% Compute the periodogram for the noisy signal (colored noise)
N = length(y);
frequencies = (0:N-1) / N * fs; % Frequency values for plotting

% Compute the periodogram
P = 1 / N * abs(fft(y)).^2;

% Plot the periodogram
figure;
subplot(2, 1, 1);
plot(frequencies, 10*log10(P));
title('Periodogram');
xlabel('Frequency (Hz)');
ylabel('Power/Frequency (dB/Hz)');
xlim([0, 0.5]); % Limit the x-axis to the range of interest


% Find the frequency with the maximum power
[max_power, idx_max_power] = max(P);
estimated_frequency = frequencies(idx_max_power);

% True frequencies
true_frequency_v0 = 0.05;
true_frequency_v1 = 0.25;

% Calculate accuracy
accuracy_v0 = abs(true_frequency_v0 - estimated_frequency);
accuracy_v1 = abs(true_frequency_v1 - estimated_frequency);

% Comment on the impact of noise correlation
fprintf('Impact of Noise Correlation on Frequency Estimation Accuracy:\n');
fprintf('True frequency v0: %.3f Hz\n', true_frequency_v0);
fprintf('True frequency v1: %.3f Hz\n', true_frequency_v1);
fprintf('Estimated frequency: %.3f Hz\n', estimated_frequency);
fprintf('Accuracy for v0: %.3f Hz\n', accuracy_v0);
fprintf('Accuracy for v1: %.3f Hz\n', accuracy_v1);
