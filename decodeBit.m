function a = decodeBit(b)
global Ones;
global Zeros;
r = rand(1);
if(b)
  for i = 1:4
    if(r <= Ones(i))
      switch(i)
        case 1
        a = [0,1,1];
        case 2
        a = [1,0,1];
        case 3
        a = [1,1,0];
        otherwise
        a = [1,1,1];
      endswitch
      break
    endif
  endfor
else
  for i = 1:4
    if(r <= Zeros(i))
      switch(i)
        case 1
        a = [0,0,0];
        case 2
        a = [0,0,1];
        case 3
        a = [0,1,0];
        otherwise
        a = [1,0,0];
      endswitch
      break
    endif
  endfor
endif
a = logical(a);
end