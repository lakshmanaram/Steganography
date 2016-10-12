function testNaiveLSB(choice)
  [cover,message] = loadTest(choice);
  pause;
  pause;
  x0 = 0.5;
  mu = 3.3;
  
  stegoImage = encodeMessage(cover,message,x0,mu);
  showImages(cover,stego);
  pause;
  display("Done Encoding Image")
  
  message = decodeMessage(stegoImage,x0,mu)
  display("Decoded message")
  pause;
  
  
end