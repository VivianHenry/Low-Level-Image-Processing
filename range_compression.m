clear;
clc;

%% Reading an image

url1 = "/Users/vivianhenry/Documents/IUPUI/Sem 2/Image Processing and Computer Vision/Programming Assignments/2/auto.pnm";
url2 = "/Users/vivianhenry/Documents/IUPUI/Sem 2/Image Processing and Computer Vision/Programming Assignments/2/building.pnm";
url3 = "/Users/vivianhenry/Documents/IUPUI/Sem 2/Image Processing and Computer Vision/Programming Assignments/2/child.pnm";
url4 = "/Users/vivianhenry/Documents/IUPUI/Sem 2/Image Processing and Computer Vision/Programming Assignments/2/tire.pnm";
url5 = "/Users/vivianhenry/Documents/IUPUI/Sem 2/Image Processing and Computer Vision/Programming Assignments/2/ct_scan.pnm";

image_original = imread(url5);  % read image

%% Range compression using log function

image_final_user = im2uint8(mat2gray(log(1+double(image_original))));

%% Plotting

subplot(1, 2, 1);
imshow(image_original); title("Original Image");
subplot(1, 2, 2);
imshow(image_final_user); title("Final Image");
