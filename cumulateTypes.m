function [Ones,Zeros] = cumulateTypes()
  Ones = [types(1,4) types(1,[6:8])];
  Zeros = [types(1,[1:3]) types(1,5)];
  sumZeros = sum(Zeros);
  sumOnes = sum(Ones);
  Zeros = Zeros./sumZeros;
  Ones = Ones./sumOnes;
  percentz = Zeros.*100;
  percentz = int8(percentz);
  percento = Ones.*100;
  percento = int8(percento); 
  for i = 2:size(Ones,2)
    Ones(i) += Ones(i-1);
  end
  for i = 2:size(Zeros,2)
    Zeros(i) += Zeros(i-1);
  end
end