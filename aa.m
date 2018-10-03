clear, clc, close all

img = im2double(imread('blurry-moon.tif'));

k=4;

hpfilter = fspecial('gaussian',[5, 5],10);

fImage1 = imfilter(img, hpfilter);
fImage = double(img) - fImage1;

hImage = double(img) + k.*fImage;

subplot(1, 3, 1), imshow(img, []), title('Original Image');
subplot(1, 3, 2), imshow(fImage, []), title('Filtered Image');
subplot(1, 3, 3), imshow(hImage, []), title('High-Boost Image');