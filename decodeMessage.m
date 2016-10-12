function message = decodeMessage(stegoImage,x0,mu)
  stegoData = stegoImage(:,:,1);
  stegoData = dec2bin(stegoData');
  
  shuffledMessageBits = LSBDecode(stegoData,2);
  
  [sorted,indices] = sort(logisticMap(x0,mu,size(shuffledMessageBits,2)));
  
  messageBits = shuffledMessageBits(indices);
  messageBits = [messageBits "00000000"];
  
  message = getMessage(messageBits);
end