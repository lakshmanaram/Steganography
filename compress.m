global I;
global X;
Output = zeros(size(I,1),size(X,2)/3);
global types = zeros(1,8);
for i = 1:size(X,1)
  for j = 1:3:size(X,2)
    [Output(i,((j-1)/3)+1), type] = encodeBit(X(i,[j:j+2]));
    types(1,type) += 1;
  endfor
endfor
disp("Processing done");
Output = logical(Output);
disp("Converted to logical values");
imwrite(Output,"compressedImg","bmp");
disp("Output saved as compressedImg.bmp");
disp("Program paused. Press enter to continue");
pause;
imshow(Output);
disp("Showing image and compressed image together");
disp("Program paused. Press enter to continue");
pause;
imshow([I,Output]);