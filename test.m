%% Information gain vs #1s - #0s
p = 0.5;
a = 0.8;

nd = -10:10;
f = arrayfun(@(x)hdif(x, p, a), nd);
plot(nd, f);

%% Information gain vs p(Y = 1 | ...)
a = 0.8;
h = 0.00001;
p = 0:h:1;
y = arrayfun(@(x)hdif(0, x, a), p);
dy = diff(y) / h;
ddy = diff(dy) / h;
subplot(1, 3, 1); plot(p, y);
subplot(1, 3, 2); plot(p, [NaN, dy]);
subplot(1, 3, 3); plot(p, [NaN, NaN, ddy]);