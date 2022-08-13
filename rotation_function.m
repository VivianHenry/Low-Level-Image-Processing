function [image_rotated] = rotation_function(image_original, angle)
% Function to take an image and angle as input, rotate the image by the
% desired angle, and provide the final image as output

[r, c] = size(image_original, [1, 2]);
rad = 2 * pi * (angle / 360);  % Converting from degrees to radians

% Calculating the size of the rotated image matrix so the rotated image completely fits

rows = ceil((r * abs(cos(rad))) + (c * abs(sin(rad)))); % abs so that positve values are attained in any case                      
cols = ceil((r * abs(sin(rad))) + (c * abs(cos(rad))));                     

% Define the rotated image matrix and fill with 0 (black)

image_rotated = uint8(zeros([rows, cols, 3]));

% Center of original and rotated image
x_original_center = ceil(r / 2); y_original_center = ceil(c / 2);  % ceil ensures its an integer value                                                            
x_rotated_center = ceil((size(image_rotated,1)) / 2); y_rotated_center = ceil((size(image_rotated,2)) / 2);

for i = 1:size(image_rotated, 1)
    for j = 1:size(image_rotated, 2)                                                       
         x = ((i - x_rotated_center) * cos(rad)) + ((j - y_rotated_center) * sin(rad));                                       
         y = -((i - x_rotated_center) * sin(rad)) + ((j - y_rotated_center) * cos(rad));                             
         x = round(x) + x_original_center;
         y = round(y) + y_original_center;

         if (x >= 1 && y >= 1 && x <= size(image_original, 1) && y <= size(image_original, 2)) 
              image_rotated(i, j, :) = image_original(x, y, :);  
         end

    end
end

end