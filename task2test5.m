Load the data from Gaussian2D.mat
load('Gaussian2D.mat');

% Define the number of bins for the histograms
num_bins = 50;

% Calculate the joint PDFs for both matrices
pdf1 = hist3(s1, [num_bins, num_bins]) / numel(s1);
pdf2 = hist3(s2, [num_bins, num_bins]) / numel(s2);

% Define the correlation coefficients
rho1 = 0.25;
rho2 = 0.75;

% Create a grid of x and y values for the 3D plots
[x, y] = meshgrid(linspace(min(s1(:,1)), max(s1(:,1)), num_bins), ...
                  linspace(min(s1(:,2)), max(s1(:,2)), num_bins));

% Create 3D plots for the PDFs
figure;
subplot(2, 2, 1);
surf(x, y, pdf1);
title('Empirical PDF for \rho = 0.25');
xlabel('X');
ylabel('Y');
zlabel('PDF');

subplot(2, 2, 2);
surf(x, y, pdf2);
title('Empirical PDF for \rho = 0.75');
xlabel('X');
ylabel('Y');
zlabel('PDF');

% Create 3D plots for the PDFs with negative correlation
subplot(2, 2, 3);
surf(x, y, pdf1);
title('Empirical PDF for \rho = -0.25');
xlabel('X');
ylabel('Y');
zlabel('PDF');

subplot(2, 2, 4);
surf(x, y, pdf2);
title('Empirical PDF for \rho = -0.75');
xlabel('X');
ylabel('Y');
zlabel('PDF');

% Set axis limits for consistency
zlim([0, max([pdf1(:); pdf2(:)])]);

% Adjust the view angles for better visualization
view(3);

% Comment on the impact of the correlation coefficient
fprintf('For positive correlation, the PDF is elongated along the diagonal.\n');
fprintf('For negative correlation, the PDF is elongated along the antidiagonal.\n');
