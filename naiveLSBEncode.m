function [stegoData success] = naiveLSBEncode(coverData,messageBits,l)
  # cover_data should be a 1D matrix of bytes - 2D matrix(size,8)
  # l is the number of Least Significant Bits substituted
  
  totalBitsEncoded = size(coverData,1)*l;
  
  if size(messageBits,2) > totalBitsEncoded
    disply("Message Overflow Error");
    success = 0;
  else
    filler = "1";
    messageBits = [messageBits repmat(filler,1,totalBitsEncoded-size(messageBits,2))];
    messageBits = reshape(messageBits,l,size(coverData,1))';
    
    % zeroBit = "0";
    % significantBits = repmat(zeroBit,size(coverData,1),8-l);
    % messageBits = [significantBits messageBits];
    % Converted to decimal and bitwise OR
    
    coverData = bitand(bin2dec(coverData),256-2^l);
    stegoData = dec2bin(bitor(coverData,bin2dec(messageBits)));
    success = 1;
  endif  
end