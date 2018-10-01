
clear, clc, close all

img = im2double(imread('circuitboard-gaussian.tif'));
m=5;
n=5;

fImage = aMean(img,m,n);
figure(1), clc;
subplot(1, 2, 1), imshow(img,[]), title('Original Image');
subplot(1, 2, 2), imshow(fImage,[]), title('Filtered Image');
    
fImage = gMean(img,m,n);
figure(2), clc;
subplot(1, 2, 1), imshow(img,[]), title('Original Image');
subplot(1, 2, 2), imshow(fImage,[]), title('Filtered Image');
    

%a
function f_hat= aMean(g,m,n)
    a = ones(m,n);
    filter = a./(m*n);
    f_hat = imfilter(g, filter);
end

%b
function f_hat= gMean(g,m,n)
    [aa, bb] = size(g);
    a  = floor(m/2);
    b  = floor(n/2);
    f_hat = zeros(m,n);                        
    tmp = 1;                                    

    for i = a+1:(aa-a)                             
        for j = b+1:(bb-b)             
            for ii = (i-a):(i+a)
                for jj = (j-b):(j+b)
                    tmp = tmp* g(ii,jj);
                end
            end
            tmp = double(tmp)^(1/9);
            f_hat(i,j) = tmp;                 
            tmp = 1;  
        end
    end
end

