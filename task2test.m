cd('/Users/haree/Downloads/Project_1 2');

% Load the data from Gaussian2D.mat
load('Gaussian2D.mat');

% Define the correlation coefficients
correlation_coefficients = [0.25, 0.75];

% Create a figure for 3D plots
figure;

for i = 1:length(correlation_coefficients)
    % Get the current data matrix
    data_matrix = eval(['s', num2str(i)]);
    
    % Extract x and y values
    x_values = data_matrix(:, 1);
    y_values = data_matrix(:, 2);
    
    % Calculate the empirical joint PDF using 2D histogram
    edges = -5:0.1:5; % Adjust the range as needed
    [counts, x_edges, y_edges] = histcounts2(x_values, y_values, edges, edges);
    
    % Normalize the counts to create the PDF
    pdf = counts / sum(counts(:));
    
    % Create a subplot for each correlation coefficient
    subplot(1, 2, i);
    
    % Transpose X and Y to match the dimensions of pdf
    [X, Y] = meshgrid(x_edges, y_edges);
    
    % Create a 3D surface plot for the empirical PDF
    surf(X', Y', pdf);
    
    % Set axis labels and title
    xlabel('X');
    ylabel('Y');
    zlabel('PDF');
    title(['Empirical PDF for \rho = ', num2str(correlation_coefficients(i))]);
    
    % Rotate the view for better visualization
    view(45, 30);
end

% Comment on the impact of correlation coefficient
fprintf('The correlation coefficient affects the shape of the PDF as follows:\n');
fprintf('For positive correlation (\rho = 0.75), the PDF has an elongated shape along the diagonal.\n');
fprintf('For lower correlation (\rho = 0.25), the PDF is less elongated and more symmetric.\n');
fprintf('If the PDF was characterized from -\rho, the shape would be similar but rotated 180 degrees.\n');
