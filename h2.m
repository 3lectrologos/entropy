function h = h2(p)
  if length(p) == 1 && p == 0
    h = 0;
    return;
  end
  if length(p) == 1
    h = -p*log(p) - (1-p)*log(1-p);
    return;
  end
  h = h2(p(1));
end