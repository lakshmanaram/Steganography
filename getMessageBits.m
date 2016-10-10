function messageBits = getMessageBits(message)
  % to include the 0x00 byte at the end of the message
  message = strcat(message,"\0");
  message = toascii(message);
  message = dec2bin(message,8);
  % message bits is a 1D vector with the messagebits
  messageBits = reshape(message',1,prod(size(message)));
end