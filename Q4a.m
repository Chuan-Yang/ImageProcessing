
clear, clc, close all

img = imread('testpattern1024.tif');

FFTS = fftshift(fft2(img)); % frequency scaling

[M, N]=size(img); % image size

D0=3; 

[X, Y]=meshgrid(0:N-1,0:M-1);
D = sqrt(((X-N/2).^2+(Y-M/2).^2));
Low = exp(-(D.^2)./(2*D0).^2);

tmp = FFTS .* Low;
fImage = ifft2(ifftshift(tmp));

subplot(1, 2, 1), imshow(img,[]), title('Original Image');
subplot(1, 2, 2), imshow(fImage,[]), title('Filtered Image');