function xp = xpost(nd, p, a)
  yp = ypost(nd, p, a);
  x0 = a*yp(1) + (1-a)*yp(2);
  x1 = a*yp(2) + (1-a)*yp(1);
  xp = [x0, x1];
end