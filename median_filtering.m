clear;
clc;

%% Reading an image

url1 = "/Users/vivianhenry/Documents/IUPUI/Sem 2/Image Processing and Computer Vision/Programming Assignments/2/auto.pnm";
url2 = "/Users/vivianhenry/Documents/IUPUI/Sem 2/Image Processing and Computer Vision/Programming Assignments/2/building.pnm";
url3 = "/Users/vivianhenry/Documents/IUPUI/Sem 2/Image Processing and Computer Vision/Programming Assignments/2/child.pnm";
url4 = "/Users/vivianhenry/Documents/IUPUI/Sem 2/Image Processing and Computer Vision/Programming Assignments/2/tire.pnm";
url5 = "/Users/vivianhenry/Documents/IUPUI/Sem 2/Image Processing and Computer Vision/Programming Assignments/2/ct_scan.pnm";
image = imread(url1);
image_original = image(:, :);

%% Adding salt and pepper noise to the image

noise_density = 0.05;
image_noise = imnoise(image_original, "salt & pepper", noise_density);

%% Median filtering

p = 3;  % Size of square mask
image_noise_user = padarray(image_noise, [1, 1]);  % Pad matrix with zeros
out = zeros([size(image_noise, 1), size(image_noise, 2)]);

for i = 1:(size(image_noise_user, 1) - 2)  % 2 so that mask is not outside the image limit
    for j = 1:(size(image_noise_user, 2) - 2)  % 2 so that mask is not outside the image limit
        window = zeros(9, 1);
        inc = 1;
        for x = 1:3
            for y = 1:3
                window(inc) = image_noise_user(i + x - 1,j + y - 1);
                inc = inc + 1;
            end
        end
        med = sort(window);
        %PLACE THE MEDIAN ELEMENT IN THE OUTPUT MATRIX
        out(i,j) = med(5);
    end
end

%% Median filtering using built-in function

image_filtered_built_in = medfilt2(image_noise, [3, 3]);

%% Plotting

subplot(2, 2, 1);
imshow(image); title("Original Image");

subplot(2, 2, 2);
imshow(image_noise); title(["Image with salt and pepper noise", "Noise density: ", num2str(noise_density)]);

subplot(2, 2, 3);
imshow(uint8(out)); title("After median avergaing (User-defined)");

subplot(2, 2, 4);
imshow(image_filtered_built_in); title("After Gaussian avergaing (Built-in function)");