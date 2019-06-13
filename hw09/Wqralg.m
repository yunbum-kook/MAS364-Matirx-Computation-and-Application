function [Tnew, sawtooth] = Wqralg(T)
% input : tridiagonal matrix T
m = length(T);
counter = 1;
tm = zeros(1,1000);
while 1
    tm(1, counter) = abs(T(m, m-1));
    if abs(T(m,m-1)) < 1e-12
        Tnew = T;
        sawtooth = tm(1,1:counter);
        break
    end
    
    shift = Wikinson(T(m-1:m, m-1:m));
    [q, r] = qr(T - shift * eye(m));
    T = r*q + shift * eye(m);
    for k=1:m-1
        T(k+2:m, k) = 0;
        T(k, k+1:m) = T(k+1:m, k)';
    end
    counter = counter + 1;
end
end
