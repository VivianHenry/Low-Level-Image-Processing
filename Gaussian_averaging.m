clear;
clc;

%% Reading an image

url1 = "/Users/vivianhenry/Documents/IUPUI/Sem 2/Image Processing and Computer Vision/Programming Assignments/2/auto.pnm";
url2 = "/Users/vivianhenry/Documents/IUPUI/Sem 2/Image Processing and Computer Vision/Programming Assignments/2/building.pnm";
url3 = "/Users/vivianhenry/Documents/IUPUI/Sem 2/Image Processing and Computer Vision/Programming Assignments/2/child.pnm";
url4 = "/Users/vivianhenry/Documents/IUPUI/Sem 2/Image Processing and Computer Vision/Programming Assignments/2/tire.pnm";
url5 = "/Users/vivianhenry/Documents/IUPUI/Sem 2/Image Processing and Computer Vision/Programming Assignments/2/ct_scan.pnm";
image = imread(url2);
image_original = image(:, :);

%% Adding Gaussian noise to the image

mean = 0.04;
std_dev = 0.003;
image_noise = imnoise(image_original,'Gaussian', mean, std_dev);

%% Developing the Gaussian averaging mask

I = double(image_noise);  % Converting to double for calculations

sigma = 1.2;  % Standard deviation
window_size = 4;  % Mask window size
[X,Y] = meshgrid(-window_size:window_size,-window_size:window_size);
coeff = 1 / (2 * pi * sigma^2);
mask = coeff * exp((-(X.^2 + Y.^2)/(2 * sigma^2)));

%% Convolution

m = size(X, 1) - 1;  % To account for size of mask
n = size(Y, 1) - 1;  % To account for size of mask

output = zeros(size(I));
I = padarray(I, [window_size window_size]);  %Pad the vector with zeros
% Without padding, black space appears along border

for i = 1:(size(I, 1) - m)
    for j = 1:(size(I, 2) - n)
        Temp = I(i:(i + m),j:(j + m)) .* mask;
        output(i, j) = sum(Temp(:));
    end
end

%% Built-in Gaussian averaging function

f = double(image_original);
wg = fspecial("gaussian",[4, 4]);  % Second argument is mask dimensions
fc = imfilter(f,wg, "conv" ,"replicate","same");

%% Plotting

subplot(2, 2, 1);
imshow(image); title("Original Image");

subplot(2, 2, 2);
imshow(image_noise); title(["Original with Gaussian noise", "Mean: ", num2str(mean), "Standard deviation: ", num2str(std_dev)]);

subplot(2, 2, 3);
imshow(uint8(output)); title(["After Gaussian avergaing (User-defined)", "Sigma: ", sigma]);

subplot(2, 2, 4);
imshow(fc, []); title("After Gaussian avergaing (Built-in function)");