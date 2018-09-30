
clear, clc, close all

img = imread('checkerboard.tif');

[Gmag, ] = imgradient(img, 'sobel');
disp(Gmag);

figure(1), clf;
subplot(1, 2, 1), imshow(img, []), title('Original Image');
subplot(1, 2, 2), imshow(Gmag, []), title('Filtered Image');



