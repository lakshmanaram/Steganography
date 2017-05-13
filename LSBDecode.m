function shuffledMessageBits = LSBDecode(stegoData,l)
  # stegoData should be a 1D matrix of bytes - 2D matrix(size,8)
  # l is the number of Least Significant Bits substituted
  
  messageBits = stegoData(:,9-l:8);
  messageBits = reshape(messageBits',1,prod(size(messageBits)));
  
  % encode messageSize in the file header.
  global messageSize;
  shuffledMessageBits = messageBits(1,1:messageSize);
  
  
  fillerBits = "11111111";
  if mod(size(messageBits,2),8) != 0
    % adding extra filler bits to facilitate reshape
    messageBits = [messageBits fillerBits(1:8-mod(size(messageBits,2),8))];
    endif
  
  
  % reshapes the message and transposes to get the right format of bytes
  messageBits = reshape(messageBits,8,prod(size(messageBits))/8)';
    
end