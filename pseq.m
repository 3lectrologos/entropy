function res = pseq(x, p, a)
  k = sum(x == 1);
  r = length(x) - k;
  d = k - r;
  %res = a^k * (1-a)^r * p + a^r * (1-a)^k * (1-p);
  res = r*log(a) + r*log(1-a) + log(a^d * p + (1-a)^d * (1-p));
end