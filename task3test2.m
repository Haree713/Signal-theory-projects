% Load the data from Gaussian2D.mat
load('Gaussian2D.mat');

% Define the number of bins for the histograms
num_bins = 50;

% Create a grid of x and y values for the 3D plots
[x, y] = meshgrid(linspace(min(s1(:,1)), max(s1(:,1)), num_bins), ...
                  linspace(min(s1(:,2)), max(s1(:,2)), num_bins));

% Calculate the joint PDFs for both matrices (positive correlation)
pdf_pos1 = hist3(s1, [num_bins, num_bins]) / numel(s1);
pdf_pos2 = hist3(s2, [num_bins, num_bins]) / numel(s2);

% Calculate the joint PDFs for both matrices (negative correlation)
data1_neg = -s1; % Reverse signs for negative correlation
data2_neg = -s2;
pdf_neg1 = hist3(data1_neg, [num_bins, num_bins]) / numel(data1_neg);
pdf_neg2 = hist3(data2_neg, [num_bins, num_bins]) / numel(data2_neg);

% Create 3D plots for the PDFs (positive correlation)
figure;

subplot(1, 1, 1);
surf(x, y, pdf_pos1);
title('Empirical PDF for \rho = 0.25 (Positive)');
xlabel('X');
ylabel('Y');
zlabel('PDF');

figure;
subplot(1, 1, 1);
surf(x, y, pdf_pos2);
title('Empirical PDF for \rho = 0.75 (Positive)');
xlabel('X');
ylabel('Y');
zlabel('PDF');

% Create 2D contour plots for the PDFs (negative correlation)
figure;
subplot(1, 1, 1);
contourf(x, y, pdf_neg1, 'LineStyle', 'none');
title('Empirical PDF for \rho = -0.25 (Negative)');
xlabel('X');
ylabel('Y');
colorbar;

figure;
subplot(1, 1, 1);
contourf(x, y, pdf_neg2, 'LineStyle', 'none');
title('Empirical PDF for \rho = -0.75 (Negative)');
xlabel('X');
ylabel('Y');
colorbar;

% Set color limits for consistency
caxis([0, max([pdf_pos1(:); pdf_pos2(:); pdf_neg1(:); pdf_neg2(:)])]);

% Adjust the view angles for better visualization
view(3);

