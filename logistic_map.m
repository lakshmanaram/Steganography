function indices = logistic_map(x0,r,n)
  chaos_map = zeros(1,n);
  chaos_map(1) = x0;
  for i=2:n
    chaos_map(i) = r*chaos_map(i-1)*(1-chaos_map(i-1));
  end
 [sorted, indices] = sort(chaos_map);
end