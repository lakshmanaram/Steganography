global coverImage;
global text;
[coverImage,text] = loadTest(1);
pause;

pkg load ga;
display("Finding the optimal initialization values to chaotic maps");
pause;
opt.MaxGenerations=20;
opt.MaxStallGenerations=20;
opt.MaxTime=2;
[optimalValues,fval,exitflag] = ga(@fitnessFunction,2,[],[],[],[],[0 0],[1 4],opt);
pause;
optimalValues = [0.33 0.6]
pause;

stegoImage = encodeMessage(coverImage,text,optimalValues(1,1),optimalValues(1,2));
imwrite(stegoImage,"tests/stegoImage","bmp");
display("Message encoded");
display("Steganography Image is stored in the tests folder");

pause;

showImages(coverImage,stegoImage);
pause;

PSNRvalue = PSNR(coverImage,stegoImage)(:,:,1)
pause;

display("Decoded Message is");
message = decodeMessage(stegoImage,optimalValues(1,1),optimalValues(1,2))