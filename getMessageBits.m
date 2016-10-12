function messageBits = getMessageBits(message)
  message = toascii(message);
  message = dec2bin(message,8);
  % message bits is a 1D vector with the messagebits
  messageBits = reshape(message',1,prod(size(message)));
end