function indices = logisticMap(x0,r,n)
  chaos_map = zeros(1,n);
  # Skipping k values at the beginning to ensure randomness in logistic mapping
  for i=1:1000  # k = 1000
    x0 = r*x0*(1-x0);
  end
  # chaos logistic map with first element as x0
  chaos_map(1) = x0;
  for i=2:n
    chaos_map(i) = r*chaos_map(i-1)*(1-chaos_map(i-1));
  end
 [sorted, indices] = sort(chaos_map);
end