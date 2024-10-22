% Sample data matrix (replace this with your data)
data= (s1);  % Generating random data for demonstration

% Calculate the mean and covariance matrix
mu = mean(data);           % Calculate mean
Sigma = cov(data);         % Calculate covariance matrix

% Create a multivariate Gaussian distribution object
pd = mvnrnd(mu, Sigma, 1000);  % Generate random samples from the distribution

% Plot the joint Gaussian distribution
figure;
scatter(pd(:, 1), pd(:, 2));
xlabel('X1');
ylabel('X2');
title('Joint Gaussian Distribution');

