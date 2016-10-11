function message = getMessage(messageBits)
  if mod(size(messageBits,2),8) != 0
    % adding extra spaces to facilitate reshape
    messageBits = strcat(messageBits,8-mod(size(messageBits,2)));  
  endif
  % reshapes the message and transposes to get the right format of bytes
  messageBits = reshape(messageBits,8,prod(size(messageBits))/8)';
  message = "";
  for i = 1:size(messageBits,2)
    charvalue = bin2dec(messageBits(i,:));
    if (charvalue == 0) %null character
      break;
    endif
    message = [message char(charvalue)];
  endfor
end