function [stegoData,remainingMessageBits] = naiveLSBEncode(coverData,messageBits,l)
  # coverData should be a 1D matrix of bytes - 2D matrix(size,8)
  # l is the number of Least Significant Bits substituted
  
  totalBitsEncoded = size(coverData,1)*l;
  remainingMessageBits = "";
  if size(messageBits,2) > totalBitsEncoded
    % fixes overflow
    remainingMessageBits = messageBits(totalBitsEncoded+1:size(messageBits,2))
    messageBits = messageBits(1:totalBitsEncoded)
    endif  
  % fixes underflow
  filler = "1";
  messageBits = [messageBits repmat(filler,1,totalBitsEncoded-size(messageBits,2))];
  messageBits = reshape(messageBits,l,size(coverData,1))';
  
  % zeroBit = "0";
  % significantBits = repmat(zeroBit,size(coverData,1),8-l);
  % messageBits = [significantBits messageBits];
  % Converted to decimal and bitwise OR
  
  coverData = bitand(bin2dec(coverData),256-2^l);
  stegoData = dec2bin(bitor(coverData,bin2dec(messageBits)));
  end