
clear, clc, close all


%-------------------------------------------------------------------------
%circuitboard-gaussian.tif
img = im2double(imread('circuitboard-gaussian.tif'));
m=5;
n=5;

fImage = aMean(img,m,n);
figure(1), clc;
subplot(1, 2, 1), imshow(img,[]), title('Gaussion Image');
subplot(1, 2, 2), imshow(fImage,[]), title('Filtered Image');
    
fImage = gMean(img,m,n);
figure(2), clc;
subplot(1, 2, 1), imshow(img,[]), title('Gaussion Image');
subplot(1, 2, 2), imshow(fImage,[]), title('Filtered Image');

fImage = hMean(img,m,n);
figure(3), clc;
subplot(1, 2, 1), imshow(img,[]), title('Gaussion Image');
subplot(1, 2, 2), imshow(fImage,[]), title('Filtered Image');

fImage = chMean(img,m,n);
figure(4), clc;
subplot(1, 2, 1), imshow(img,[]), title('Gaussion Image');
subplot(1, 2, 2), imshow(fImage,[]), title('Filtered Image');


%-------------------------------------------------------------------
%circuitboard-pepper.tif
img = im2double(imread('circuitboard-pepper.tif'));
fImage = aMean(img,m,n);
figure(5), clc;
subplot(1, 2, 1), imshow(img,[]), title('Pepper Noise Image');
subplot(1, 2, 2), imshow(fImage,[]), title('Filtered Image');
    
fImage = gMean(img,m,n);
figure(6), clc;
subplot(1, 2, 1), imshow(img,[]), title('Pepper Noise Image');
subplot(1, 2, 2), imshow(fImage,[]), title('Filtered Image');

fImage = hMean(img,m,n);
figure(7), clc;
subplot(1, 2, 1), imshow(img,[]), title('Pepper Noise Image');
subplot(1, 2, 2), imshow(fImage,[]), title('Filtered Image');

fImage = chMean(img,m,n);
figure(8), clc;
subplot(1, 2, 1), imshow(img,[]), title('Pepper Noise Image');
subplot(1, 2, 2), imshow(fImage,[]), title('Filtered Image');


%-------------------------------------------------------------------
%circuitboard-salt.tif
img = im2double(imread('circuitboard-salt.tif'));
fImage = aMean(img,m,n);
figure(9), clc;
subplot(1, 2, 1), imshow(img,[]), title('Salt Noise Image');
subplot(1, 2, 2), imshow(fImage,[]), title('Filtered Image');
    
fImage = gMean(img,m,n);
figure(10), clc;
subplot(1, 2, 1), imshow(img,[]), title('Salt Noise Image');
subplot(1, 2, 2), imshow(fImage,[]), title('Filtered Image');

fImage = hMean(img,m,n);
figure(11), clc;
subplot(1, 2, 1), imshow(img,[]), title('Salt Noise Image');
subplot(1, 2, 2), imshow(fImage,[]), title('Filtered Image');

fImage = chMean(img,m,n);
figure(12), clc;
subplot(1, 2, 1), imshow(img,[]), title('Salt Noise Image');
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
            tmp = double(tmp).^(1/(m*n));
            f_hat(i,j) = tmp;                 
            tmp = 1;  
        end
    end
end

%c
function f_hat= hMean(g,m,n)
    [aa, bb] = size(g);
    a  = floor(m/2);
    b  = floor(n/2);
    f_hat = zeros(m,n);                        
    tmp = 0;                                    

    for i = a+1:(aa-a)                             
        for j = b+1:(bb-b)             
            for ii = (i-a):(i+a)
                for jj = (j-b):(j+b)
                    tmp = double(tmp + 1/g(ii,jj));
                end
            end
            tmp = (m*n)/tmp;
            f_hat(i,j) = tmp;                 
            tmp = 0;  
        end
    end
end

%d
function f_hat= chMean(g,m,n)
    [aa, bb] = size(g);
    a  = floor(m/2);
    b  = floor(n/2);
    Q = 1.5;
    f_hat = zeros(m,n);                        
    tmp = 0;                                    

    for i = a+1:(aa-a)                             
        for j = b+1:(bb-b)             
            for ii = (i-a):(i+a)
                for jj = (j-b):(j+b)
                    tmp = tmp + g(ii,jj);
                end
            end
            tmp = (tmp.^(Q+1))/(tmp.^Q);
            f_hat(i,j) = tmp;                 
            tmp = 0;  
        end
    end
end


