function message = decodeMessage(stegoImage,x0,mu)
  stegoData = stegoImage(:,:,1);
  stegoData = dec2bin(stegoData');
  global messageSize;
  
  shuffledMessageBits = LSBDecode(stegoData,2);
  
  [sorted,indices] = sort(logisticMap(x0,mu,messageSize,2));
  
  messageBits = shuffledMessageBits(indices);
  % messageBits = [messageBits "00000000"];
  
  message = getMessage(messageBits);
end