function hd = hdif(nd, p, a)
  yp = ypost(nd, p, a);
  hy = h2(yp);
  xp = xpost(nd, p, a);
  hy0 = h2(ypost(nd-1, p, a));
  hy1 = h2(ypost(nd+1, p, a));
  ehy = sum(xp.*[hy0, hy1]);
  hd = hy - ehy;
end