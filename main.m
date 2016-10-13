global coverImage;
global text;
[coverImage,text] = loadTest(1);
pause;

pkg load ga;
display("Finding the optimal initialization values to chaotic maps");
options.MaxGenerations = 25;
[optimalValues,fval,exitflag] = ga(@fitnessFunction,2,[],[],[],[],[0 0],[1 4],options)
optimalValues
pause;

stegoImage = encodeMessage(coverImage,text,optimalValues(1,1),optimalValues(1,2));
imwrite(stegoImage,"tests/stegoImage","bmp");
display("Message encoded");
display("Steganography Image is stored in the tests folder");

pause;

showImages(coverImage,stegoImage);
pause;

PSNRvalue = PSNR(coverImage,stegoImage);
pause;

decodeMessage(stegoImage,optimalValues(1,1),optimalValues(1,2));