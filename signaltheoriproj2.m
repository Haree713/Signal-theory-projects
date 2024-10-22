pic=imread('kth.jpg');
load ('training.mat');
load ('spydata.mat');



[key, cPic] = encoder(pic);


% Given FIR filter coefficients
h = [1, 0.7, 0.7, 0]; % Order 3 FIR filter

% Assuming key is your original key (including training sequence)
% key = ... (your original key)

% Transmit the key over the noiseless channel using convolution
distortedKey = conv(key, h);

distortedKey(distortedKey > 0) = 1;
distortedKey(distortedKey < 0) = -1;
distortedKey(distortedKey == 0) = -1;

% Make sure the distorted key and original key have the same size
% Adjust the size of distortedKey if necessary
distortedKey = distortedKey(1:length(key));

X = training; %undisturbed key
Y= received;

rY = xcorr(Y); %acf of disturbed key
rXY = xcorr(X, Y); %cross corr of key and undisturbed key

%using only the right part of symmetric rXY starting from index 0
rXY = rXY(length(X):end);

%building the matrix RY with rY values
RY = [];
for N = 1:32
    newRow = [];
    for k = 1:32
        newRow = [newRow rY(length(Y)+k-N)];
    end
    RY = [RY;newRow];
end

%finding smallest error
biterror = zeros(32, 1);

%try different values for N
for N = 1:32
    wienerfilter = RY(1:N,1:N)\rXY(1:N); %calc coeff
    Xhat = sign(filter(wienerfilter, 1, Y)); %equalizer
     
    err = 0;
    for k = N+1:32
        if Xhat(k) ~= X(k)
            err = err + 1; %summing up errors between key and disturbed key
        end
    end
    biterror(N) = err;
end

[minError, n_min] = min(biterror);

%filter with min error

Wiener = RY(1:n_min,1:n_min)\rXY(1:n_min);
Xhat = sign(filter(Wiener, 1, received)); 



dPic = decoder(Xhat,cPic);

image(dPic);


