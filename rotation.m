clear;
clc;

%% Reading an image

url1 = "/Users/vivianhenry/Documents/IUPUI/Sem 2/Image Processing and Computer Vision/Programming Assignments/2/auto.pnm";
url2 = "/Users/vivianhenry/Documents/IUPUI/Sem 2/Image Processing and Computer Vision/Programming Assignments/2/building.pnm";
url3 = "/Users/vivianhenry/Documents/IUPUI/Sem 2/Image Processing and Computer Vision/Programming Assignments/2/child.pnm";
url4 = "/Users/vivianhenry/Documents/IUPUI/Sem 2/Image Processing and Computer Vision/Programming Assignments/2/tire.pnm";
url5 = "/Users/vivianhenry/Documents/IUPUI/Sem 2/Image Processing and Computer Vision/Programming Assignments/2/ct_scan.pnm";
image_original = imread(url5);

%% Rotating an image (User-defined function)

angle = input("Enter the required degree of rotation: ");  % Request angle from user
image_rotated = rotation_function(image_original, angle);  % Function call

%% Rotating an image (In-built function)

image_rotated_built = imrotate(image_original, angle);

%% Plotting

subplot(1, 3, 1);
imshow(image_original); title("Original Image");
subplot(1, 3, 2);
imshow(image_rotated); title(["Image rotated by", num2str(angle), "degrees (User-defined)"]);
subplot(1, 3, 3);
imshow(image_rotated_built); title(["Image rotated by", num2str(angle), "degrees (Built-in)"]);
