    

%a
function f_hat= aMean[g,m,n]
    a = ones(m,n);
    filter = a./(m*n);
    f_hat = imfilter(h, filter);
end

%b
function f_hat= gMean[g,m,n]
    [m,n] = size(input_noise);                  
    output = zeros(m,n);                        %output image set with placeholder values of all zeros
    val = 1;                                    %variable to hold new pixel value

    for i = 2:m-2                               %loop through each pixel in original image
        for j = 2:n-2                           %compute geometric mean of 3x3 window around pixel
            p = input_noise(i-1,j-1);
            q = input_noise(i-1,j);
            r = input_noise(i-1,j+1);
            s = input_noise(i,j-1);
            t = input_noise(i,j);
            u = input_noise(i,j+1);
            v = input_noise(i+1,j-1);
            w = input_noise(i+1,j);
            x = input_noise(i+1,j+1);

            val = (p*q*r*s*t*u*v*w*x)^(1/9);
            output(i,j) = val;                  %set output pixel to computed geometric mean
            val = 1;                            %reset val for next pixel
        end
    end
    f_hat = imfilter(h, filter);
end

