function x = toepsolve(r)
   
N = length(r) - 1;
r = r(:);
x = conj(r(2)) / r(1);
for n = 1 : N - 1
    Jn = flipud(x);
    alpha = (conj(r(n + 2)) - r(2 : n + 1)' * Jn) / (r(1) - r(2 : n + 1)' * conj(x));
    tmp = x - conj(Jn) * alpha;
    x = [tmp; alpha];
end