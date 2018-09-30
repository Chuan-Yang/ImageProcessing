
clear, clc, close all

img = imread('testpattern1024.tif');

FFTS = fftshift(fft2(img)); % frequency scaling

[M, N]=size(img); % image size

D0=10; 
n = 2;
[X, Y]=meshgrid(0:N-1,0:M-1);
D = sqrt(((X-N/2).^2+(Y-M/2).^2));

Low = 1 ./ (1+(D./D0).^(2*n));

tmp = FFTS .* Low;
fImage = ifft2(ifftshift(tmp));

% fImage = imfilter(img, Low);
subplot(1, 2, 1), imshow(img,[]), title('Original Image');
subplot(1, 2, 2), imshow(fImage,[]), title('Filtered Image');