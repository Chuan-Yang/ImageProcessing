
clear, clc, close all

img = imread('circuitboard-saltandpep.tif');
m=5;
n=5;

fImage = minFilter(img,m,n);
figure(1), clc;
subplot(1, 2, 1), imshow(img,[]), title('Original Image');
subplot(1, 2, 2), imshow(fImage,[]), title('Filtered Image');

fImage = medianFilter(img,m,n);
figure(2), clc;
subplot(1, 2, 1), imshow(img,[]), title('Original Image');
subplot(1, 2, 2), imshow(fImage,[]), title('Filtered Image');

fImage = maxFilter(img,m,n);
figure(3), clc;
subplot(1, 2, 1), imshow(img,[]), title('Original Image');
subplot(1, 2, 2), imshow(fImage,[]), title('Filtered Image');

function f_hat = minFilter(g, m, n)
    f = @(x) min(x(:));
    f_hat = nlfilter(g,[m n],f);
end

function f_hat = medianFilter(g, m, n)
    f = @(x) median(x(:));
    f_hat = nlfilter(g,[m n],f);
end

function f_hat = maxFilter(g, m, n)
    f = @(x) max(x(:));
    f_hat = nlfilter(g,[m n],f);
end