function [stegoData,remainingMessageBits] = naiveLSBEncode(coverData,messageBits,l)
  # coverData should be a 1D matrix of bytes - 2D matrix(size,8)
  # l is the number of Least Significant Bits substituted
  
  totalBitsEncoded = size(coverData,1)*l;
  remainingMessageBits = "";
  if size(messageBits,2) > totalBitsEncoded
    % fixes overflow
    remainingMessageBits = messageBits(totalBitsEncoded+1:size(messageBits,2));
    messageBits = messageBits(1:totalBitsEncoded);
    endif  
  
  % fixes underflow
  filler = "1";
  messageBits = [messageBits repmat(filler,1,l-mod(size(messageBits,2),l))];
  messageRows = size(messageBits,2)/l;
  messageBits = reshape(messageBits,l,messageRows)';
  
  % zeroBit = "0";
  % significantBits = repmat(zeroBit,size(coverData,1),8-l);
  % messageBits = [significantBits messageBits];
  % Converted to decimal and bitwise OR
  
  stegoData = coverData;
  stegoData(1:messageRows,:) = dec2bin(bitor(bitand(bin2dec(coverData(1:messageRows,:)),256-2^l),bin2dec(messageBits)),8);

  
  end