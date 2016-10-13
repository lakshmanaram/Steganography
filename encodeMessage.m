function stegoImage = encodeMessage(cover,message,x0,mu)
  messageBits = getMessageBits(message);
  global messageSize = size(messageBits,2);
  
  % shuffle the message bits according to the logistic mapping given by x0, mu
  shuffledMessageBits = messageBits(logisticMap(x0,mu,size(messageBits,2)));
  
  % to include the 0x00 byte at the end of the message
  shuffledMessageBits = [shuffledMessageBits "00000000"];
  
  x = cover(:,:,1);
  coverData = dec2bin(x');
  % TODO split into 64 cells and call naiveLSBEncode
  [stegoData,remainingMessageBits] = adaptiveLSBEncode(coverData, shuffledMessageBits, 2);
  
  stegoImage = cover;
  
  stegoData = bin2dec(stegoData);
  stegoImage(:,:,1) = reshape(stegoData,size(x,2),size(x,1))';
  
  global stegoNaive;
  [stegoNaiveData,rem] = naiveLSBEncode(coverData, shuffledMessageBits, 2);
  clear rem;
  stegoNaive = stegoImage;
  stegoNaive(:,:,1) = reshape(bin2dec(stegoNaiveData),size(x,2),size(x,1))';
  
end