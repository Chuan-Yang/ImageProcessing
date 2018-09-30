
clear, clc, close all

img = imread('blurry-moon.tif');

FFTS = fftshift(fft2((img))); % frequency scaling

[M, N]=size(img); % image size

D0=5; 
k = 3;

[X, Y]=meshgrid(0:N-1,0:M-1);
D = sqrt(((X-N/2).^2+(Y-M/2).^2));
Low = exp(-(D.^2)./(2*D0).^2);
High = 1 - Low;

tmp = FFTS .* High;
fImage = ifft2(ifftshift(tmp));

hImage = double(img) + k.*fImage;

subplot(1, 3, 1), imshow(img, []), title('Original Image');
subplot(1, 3, 2), imshow(fImage, []), title('Filtered Image');
subplot(1, 3, 3), imshow(hImage, []), title('High-Boost Image');

