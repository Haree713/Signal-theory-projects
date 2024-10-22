% Load the data from SinusInNoise1.mat
load('SinusInNoise1.mat');

% Define signal parameters
fs = 1; % Sampling frequency (normalized)
v0 = 0.05;
v1 = 0.25;
A = 1; % Signal amplitude
phi0 = 0; % Initial phase for v0
phi1 = 0; % Initial phase for v1

% Compute the periodogram for each sequence
N = length(y1);
frequencies = (0:N-1) / N * fs; % Frequency values for plotting

% Compute the periodograms
P0 = 1 / N * abs(fft(y1)).^2;
P1 = 1 / N * abs(fft(y2)).^2;

% Plot the periodograms
figure;
subplot(2, 1, 1);
plot(frequencies, 10*log10(P0));
title('Periodogram of H0');
xlabel('Frequency (Hz)');
ylabel('Power/Frequency (dB/Hz)');
xlim([0, 0.5]); % Limit the x-axis to the range of interest

subplot(2, 1, 2);
plot(frequencies, 10*log10(P1));
title('Periodogram of H1');
xlabel('Frequency (Hz)');
ylabel('Power/Frequency (dB/Hz)');
xlim([0, 0.5]); % Limit the x-axis to the range of interest

% Comment on the accuracy of the recovered sinusoidal frequencies
% To do this, observe the peaks in the periodograms.

% Find the frequency with the maximum power in H0
[max_power_H0, idx_max_power_H0] = max(P0);
recovered_frequency_H0 = frequencies(idx_max_power_H0);
fprintf('Recovered frequency in H0: %.3f Hz\n', recovered_frequency_H0);

% Find the frequencies with the maximum power in H1
[max_power_H1, idx_max_power_H1] = maxk(P1, 2);
recovered_frequencies_H1 = frequencies(idx_max_power_H1);
fprintf('Recovered frequencies in H1: %.3f Hz and %.3f Hz\n', recovered_frequencies_H1);

% Comment on the accuracy of the recovered frequencies
% Compare the recovered frequencies with the known frequencies v0 and v1.
fprintf('Accuracy of the recovered frequencies:\n');
fprintf('For H0: %.3f Hz (Expected: %.3f Hz)\n', recovered_frequency_H0, v0);
fprintf('For H1: %.3f Hz and %.3f Hz (Expected: %.3f Hz and %.3f Hz)\n', ...
    recovered_frequencies_H1(1), recovered_frequencies_H1(2), v0, v1);
