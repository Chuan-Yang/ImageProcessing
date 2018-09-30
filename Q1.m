
clear, clc, close all

img = (imread('testpattern.tif'));

weight = ones(60)/3600;

fImage = conv2(single(img), weight, 'same');

subplot(1, 2, 1), imshow(img, []), title('Original Image');
subplot(1, 2, 2), imshow(fImage, []), title('Filtered Image');