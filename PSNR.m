function PSNRvalue = PSNR(coverImage,stegoImage)
  PSNRvalue = sum(sum((coverImage-stegoImage).^2));
  PSNRvalue = -10*log10(PSNRvalue/(255*255*prod(size(coverImage))));
  end