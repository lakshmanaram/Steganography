function message = naiveLSBDecode(stegoData,l)
  # stegoData should be a 1D matrix of bytes - 2D matrix(size,8)
  # l is the number of Least Significant Bits substituted
  
  messageBits = stegoData(:,9-l:8);
  messageBits = reshape(messageBits',1,prod(size(messageBits)));
  message = getMessage(messageBits);
end