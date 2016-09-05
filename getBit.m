function [o,type] = getBit(a)
if(a(1))
if(a(2))
if(a(3))
o = 1;
type = 8;
else
o = 1;
type = 7;
endif
else
if(a(3))
o = 1;
type = 6;
else
o = 0;
type = 5;
endif
endif
else
if(a(2))
if(a(3))
o = 1;
type = 4;
else
o = 0;
type = 3;
endif
else
if(a(3))
o = 0;
type = 2;
else
o = 0;
type = 1;
endif
endif
end