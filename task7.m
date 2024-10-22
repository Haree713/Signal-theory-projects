% Define the parameters
sigma_x = 1;
beta = 0.25;
alpha = 0.25;

% Create a vector of numerical values for v
v_values = linspace(-10, 10, 1000); % Adjust the range and number of points as needed

% Initialize an array to store the inverse transform values
inverse_transform_values = zeros(size(v_values));

% Evaluate the inverse Fourier transform for each v value
for i = 1:numel(v_values)
    v = v_values(i);
    w = 2 * pi * v;
    y = sigma_x^2 ./ (abs(1 - beta * exp(-1i * w)).^2 .* (1 + alpha^2 - 2 * alpha * cos(2 * pi * v)));
    
    % Compute the inverse Fourier transform using numerical integration (ifft)
    inverse_transform_values(i) = ifft(y);
end

% Plot the real part of the inverse Fourier transform
figure;
plot(v_values, real(inverse_transform_values), 'b', 'LineWidth', 2);
xlabel('v');
ylabel('Real Part');
title('Inverse Fourier Transform (Numerical)');
grid on;
