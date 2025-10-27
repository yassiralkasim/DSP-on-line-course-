% Step 1: Load the image
image = imread('sample.jpg'); % Replace 'example.jpg' with your image file

% Step 2: Convert to grayscale
grayImage = rgb2gray(image);

% Step 3: Apply Gaussian blur
h = fspecial('gaussian', [5 5], 1); % Create a Gaussian filter
blurredImage = imfilter(grayImage, h, 'replicate');

% Step 4: Apply Canny edge detection
edges = edge(blurredImage, 'Canny');

% Step 5: Save the processed image
imwrite(edges, 'edges_detected.jpg');

% Step 6: Visualize the original and processed images
figure;

% Original Image
subplot(2, 2, 1);
imshow(image);
title('Original Image');

% Grayscale Image
subplot(2, 2, 2);
imshow(grayImage);
title('Grayscale Image');

% Blurred Image
subplot(2, 2, 3);
imshow(blurredImage);
title('Blurred Image');

% Edges Detected
subplot(2, 2, 4);
imshow(edges);
title('Edges Detected');
