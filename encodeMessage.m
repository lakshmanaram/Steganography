function [stegoImage] = encodeMessage(cover,message,x0,mu)
  messageBits = getMessageBits(message);

  # shuffle the message bits according to the logistic mapping given by x0, mu
  shuffledMessage = message(logisticMap(x0,mu,size(message,2)))
  
  
  end