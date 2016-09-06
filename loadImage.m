pkg load image;
disp("Loading Image library");
I = imread("image.jpg");
I = im2bw(I);
disp("Image Read and converted to Black and white");
disp("Program paused. Press enter to continue");
pause;
imshow(I);