clear;
clc;

%% Reading an image

url1 = "/Users/vivianhenry/Documents/IUPUI/Sem 2/Image Processing and Computer Vision/Programming Assignments/2/auto.pnm";
url2 = "/Users/vivianhenry/Documents/IUPUI/Sem 2/Image Processing and Computer Vision/Programming Assignments/2/building.pnm";
url3 = "/Users/vivianhenry/Documents/IUPUI/Sem 2/Image Processing and Computer Vision/Programming Assignments/2/child.pnm";
url4 = "/Users/vivianhenry/Documents/IUPUI/Sem 2/Image Processing and Computer Vision/Programming Assignments/2/tire.pnm";
url5 = "/Users/vivianhenry/Documents/IUPUI/Sem 2/Image Processing and Computer Vision/Programming Assignments/2/ct_scan.pnm";

image = imread(url5); % Read image
figure,imshow(image); title("Original Image");

%% Histogram equalization (user-defined)

image_original = image;
[r,c] = size(image_original);  % Input image size
image_final_user = uint8(zeros(r,c));
n = r*c;  % Image area

% Key variables
freq_count = zeros(256,1);  % Counts the occurrence of each pixel value
pdf = zeros(256,1);  % Tracks the probability of occurence of each pixel value
cdf = zeros(256,1);  % Cumulative distribution probability
output = zeros(256,1);
cum = zeros(256,1);

for i = 1:r
    for j = 1:c
        value = image_original(i,j);
        freq_count(value+1) = freq_count(value+1)+1;
        pdf(value+1) = freq_count(value+1)/n;
    end
end

sum = 0;
no_of_bins = 255;

for i = 1:size(pdf)
    sum = sum + freq_count(i);
    cum(i) = sum;
    cdf(i) = cum(i)/n;
    output(i) = round(cdf(i)*no_of_bins);
end

for i = 1:r
    for j = 1:c
        image_final_user(i,j) = output(image_original(i,j)+1);
    end
end

figure,imshow(image_final_user); title("Output Image (User-defined function)");

%% Histogram equalization (built-in function)

image_final_built = histeq(image);
figure,imshow(image_final_built); title("Output Image (Built-in function)");

%% Displaying

figure
subplot(3, 2, 1);
imshow(image); title("Original Image");
subplot(3, 2, 2);
histogram(image); title("Image Histogram (Original Image)");

subplot(3, 2, 3);
imshow(image_final_user); title("Output Image (User-defined function)");
subplot(3, 2, 4);
histogram(image_final_user); title("Image Histogram (User-defined function)");

subplot(3, 2, 5);
imshow(image_final_built); title("Output Image (Built-in function)");
subplot(3, 2, 6);
histogram(image_final_built); title("Image Histogram (Built-in function)");
