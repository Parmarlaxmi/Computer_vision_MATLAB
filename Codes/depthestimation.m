% Load left and right stereo images
left_image = imread('sceneLeft.jpg');
right_image = imread('sceneRight.jpg');
left_gray = rgb2gray(left_image);
right_gray = rgb2gray(right_image);
disparity_range = [-16, 16];
disparity_map = disparity(left_gray, right_gray, 'BlockSize', 15,
'DisparityRange', disparity_range);
disparity_map(disparity_map == 0) = NaN;
baseline_distance = 100;
focal_length = 100;
depth_map = (focal_length * baseline_distance) ./ disparity_map;
% Display the depth map
figure;
imshow(depth_map, []);
title('Depth Map');
% Optionally, visualize the disparity map
figure;
imshow(disparity_map, []);
title('Disparity Map');
