function [cover,text] = loadTest(i)
  pkg load image;
  if i==1
    display("Laoding South Dakota Image");
    cover = imread("tests/south_dakota_cover.jpg");
    fid = fopen("tests/south_dakota_message.txt");
    text = fgetl(fid);
    fclose(fid);
  endif
  imshow(cover)
end