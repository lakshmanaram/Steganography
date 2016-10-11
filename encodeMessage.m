function [stegoImage] = encodeMessage(cover,message)
  messageBits = getMessageBits(message);
  x0 = 0.5;
  mu = 3.3;
  shuffledMessage = message(logisticMap(x0,mu,size(message,2)))
end