% Load your periodograms for both cases
% Replace 'periodogram_case1' and 'periodogram_case2' with your actual periodograms
load('SinusInNoise1.mat');

% Define the threshold for peak detection (adjust as needed)
threshold = 0.01;  % You can adjust this threshold value
fs = 1000;

% Find peaks in the periodograms for both cases
[Pxx1, frequencies1] = periodogram(y1, [], [], fs);
[Pxx2, frequencies2] = periodogram(y2, [], [], fs);


[pks_case1, locs_case1] = findpeaks(Pxx1, 'MinPeakHeight', threshold);
[pks_case2, locs_case2] = findpeaks(Pxx2, 'MinPeakHeight', threshold);

% Convert peak locations (indices) to frequencies
sampling_frequency = 1;  % Replace with your actual sampling frequency
normalized_frequencies_case1 = locs_case1 / length(Pxx1);
estimated_frequencies_case1 = normalized_frequencies_case1 * (sampling_frequency / 2);

normalized_frequencies_case2 = locs_case2 / length(Pxx2);
estimated_frequencies_case2 = normalized_frequencies_case2 * (sampling_frequency / 2);

% Display the estimated frequencies
fprintf('Estimated Frequencies for Case 1: %.3f Hz\n', estimated_frequencies_case1);
fprintf('Estimated Frequencies for Case 2: %.3f Hz\n', estimated_frequencies_case2);


