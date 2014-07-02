function dist = ypost(nd, p, a)
  py0 = 1 / (1 + (p/(1-p))*(a/(1-a))^nd);
  py1 = 1 / (1 + ((1-p)/p)*((1-a)/a)^nd);
  dist = [py0, py1];
end