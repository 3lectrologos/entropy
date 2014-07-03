p = 0.7;
a = 0.7;
KMAX = 20;

hdr = arrayfun(@(d)hdif(d, p, a), -KMAX:KMAX);

pthresh = [0.7, 0.8, 0.85, 0.9, 0.95, 0.99];
ptotal = cell(1, length(pthresh));
for pti = 1:length(pthresh)
  ptotal{pti} = zeros(1, KMAX);
  for K = 1:KMAX
    K
    ps = zeros(1, 2^K);
    sr = zeros(1, 2^K);
    pt = 0;
    for i = 0:2^K-1
      x = sscanf(dec2bin(i, K), '%1d')';
      ps(i+1) = pseq(x, p, a);
      sr(i+1) = seqratio(x, hdr);
    end
    fun = @(t)exp(logsumexp(ps(sr < t), 2)) - pthresh(pti);
    ptotal{pti}(K) = fzero(fun, 10);
  end

end

for pti = 1:length(pthresh)
  subplot(2, 3, pti);
  plot(ptotal{pti});
  xlim([1, KMAX]);
  ylim([1, 400]);
  xlabel('k');
  ylabel('max. ratio');
  title(sprintf('Prob = %.2f', pthresh(pti)));
end