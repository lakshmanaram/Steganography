#pkg load image;
#disp("Loading Image library");
function [I,X] = loadImage(a)
global I;
global X;
switch(a)
  case 1
    I = imread("image.jpg");
    I = im2bw(I);
    X = [ I zeros(size(I,1) , 1)];
  case 2
    I = imread("tree.jpg");
    I = im2bw(I);
    X = [ I zeros(size(I,1) , 2)];
  case 3
    I = imread("forest.png");
    I = im2bw(I);
    X = [ I zeros(size(I,1) , 1)];
  otherwise
    disp("Add more images");
  endswitch
disp("Image Read and converted to Black and white");
disp("Program paused. Press enter to continue");
pause;
imshow(I);

end