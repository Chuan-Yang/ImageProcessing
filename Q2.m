
clear, clc, close all

img = imread('checkerboard.tif');


Gy = [-1 -2 -1;0 0 0;1 2 1];
Gx = Gy';
% fImage = edge(img,'sobel','horizontal');
%fImage = conv2(single(img), Gy, 'same');
fImage = imfilter(img, Gy);
figure(1), clf;
subplot(1, 2, 1), imshow(img, []), title('Original Image');
subplot(1, 2, 2), imshow(fImage, []), title('Filtered Image');

figure(2), clf;
%fImage = conv2(single(img), Gx, 'same');
fImage = imfilter(img, Gx);
% fImage = edge(img,'sobel','vertical');
subplot(1, 2, 1), imshow(img, []), title('Original Image');
subplot(1, 2, 2), imshow(fImage, []), title('Filtered Image');
