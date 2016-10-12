function [stegoData,remainingMessageBits] = adaptiveLSBEncode(coverData,messageBits,l)
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
  
  stegoData1 = coverData;
  stegoData2 = coverData;
  stegoData = coverData;
  
  % Least Modification Rule
  stegoData1(1:messageRows,:) = dec2bin(bitor(bitand(bin2dec(coverData(1:messageRows,:)),256-2^l),bin2dec(messageBits)),8);
  stegoData2(1:messageRows,:) = dec2bin(max([zeros(messageRows,1) bitor(bitand(bin2dec(coverData(1:messageRows,:)),256-2^l),bin2dec(messageBits))-2^l]')',8);
  for i = 1:messageRows
    if abs(bin2dec(stegoData1(i,:)) - bin2dec(coverData(i,:))) <= abs(bin2dec(stegoData2(i,:))-bin2dec(coverData(i,:)))
      stegoData(i,:) = stegoData1(i,:);
      else
      stegoData(i,:) = stegoData2(i,:);
      endif
    endfor
  
  
  end