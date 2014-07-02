a = 0.8;
p = 0:0.001:1;
xp = cell2mat(arrayfun(@(x)xpost(3, x, a)', p, 'UniformOutput', false));
xp0 = cell2mat(arrayfun(@(x)xpost(2, x, a)', p, 'UniformOutput', false));
xp1 = cell2mat(arrayfun(@(x)xpost(4, x, a)', p, 'UniformOutput', false));
% Probabilities of observing 01
f1 = xp(1, :).*xp0(2, :);
% Probabilities of observing 10
f2 = xp(2, :).*xp1(1, :);
% Probabilities of observing 11
f3 = xp(2, :).*xp1(2, :);
% Product
f4 = xp(2, :).*xp(2, :);

plot(p, f1, p, f2, p, f3, p, f4);