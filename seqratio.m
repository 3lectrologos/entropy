function r = seqratio(x, hdr)
  xc = x;
  xc(xc == 0) = -1;
  xc = [0, cumsum(xc)];
  hd = hdr(ceil(length(hdr)/2) + xc);
  hdmax = hd;
  % Array of maximum gains from i up to end
  for i = (length(hd)-1):-1:1
    if hdmax(i) < hdmax(i+1)
      hdmax(i) = hdmax(i+1);
    end
  end
  r = 1;
  hdmin = hd(1);
  for i = 1:length(hd)
    if hd(i) < hdmin
      hdmin = hd(i);
    end
    cr = hdmax(i) / hdmin;
    if cr > r
      r = cr;
    end
  end
end