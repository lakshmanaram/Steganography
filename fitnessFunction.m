function val = fitnessFunction(values)
  global coverImage;
  global text;
  stegoImage = encodeMessage(coverImage,text,values(1,1),values(1,2));
  val = -PSNR(coverImage(:,:,1),stegoImage(:,:,1))
  end