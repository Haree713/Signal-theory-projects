% Load the data from SinusInNoise2.mat
load('SinusInNoise2.mat');

% Define signal parameters
fs = 1; % Sampling frequency (normalized)
v0 = 0.05;
v1 = 0.25;

% Compute the periodogram for the sequence
N = length(y);
frequencies = (0:N-1) / N * fs; % Frequency values for plotting

% Compute the periodogram
P = 1 / N * abs(fft(y)).^2;

% Plot the periodogram
figure;
plot(frequencies, 10*log10(P));
title('Periodogram of Signal with Correlated Noise');
xlabel('Frequency (Hz)');
ylabel('Power/Frequency (dB/Hz)');
xlim([0, 0.5]); % Limit the x-axis to the range of interest

% Find the frequencies corresponding to the peaks in the periodogram
[~, peak_indices] = findpeaks(P);

% Extract the estimated frequencies
estimated_frequencies = frequencies(peak_indices);

% Compare the estimated frequencies to the expected frequencies
fprintf('Estimated frequencies: %.3f Hz\n', estimated_frequencies);
fprintf('Expected frequencies: %.3f Hz and %.3f Hz\n', v0, v1);

% Comment on the impact of correlated noise on estimation accuracy
% Analyze how closely the estimated frequencies match the expected frequencies.

