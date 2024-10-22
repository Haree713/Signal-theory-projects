% Define the range of normalized frequency v
v = linspace(-0.5, 0.5, 1000); % Adjust the range as needed

% Calculate the expression
expr = 1 ./ (abs(1 - 0.25 * exp(-1i * 2 * pi * v)).^2 .* (1 + 0.25^2 - 0.5 * cos(2 * pi * v)));

% Create a figure and plot the expression
figure;
plot(v, expr);
%title('Power spectrum of R_{x2}');
xlabel('Normalized Frequency (v)');
%ylabel('Value');
grid on;

% Show the plot


