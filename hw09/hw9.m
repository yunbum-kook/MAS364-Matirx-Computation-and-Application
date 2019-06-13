%%%%% Problem 1 %%%%%
A = hilb(4);

%(a)
tridiag(A);

%(b)
[T, ~] = qralg(tridiag(A)); T;

%(c)
m = length(A); reduced_A = tridiag(A);
ew = zeros(1, m);
sawtooth = [0];
for i=1:m-1
    [newT, new_sawtooth] = qralg(reduced_A);
    sawtooth = [sawtooth, new_sawtooth];
    len = length(newT);
    ew(1, i) = newT(len, len);
    reduced_A = newT(1:len-1, 1:len-1);
end
ew(1, m) = newT(1,1); ew
figure;
semilogy(sawtooth(1, 2:end));

%(d)
m = length(A); reduced_A = tridiag(A);
ew = zeros(1, m);
sawtooth = [0];
for i=1:m-1
    [newT, new_sawtooth] = Wqralg(reduced_A);
    sawtooth = [sawtooth, new_sawtooth];
    len = length(newT);
    ew(1, i) = newT(len, len);
    reduced_A = newT(1:len-1, 1:len-1);
end
ew(1, m) = newT(1,1); ew
figure;
semilogy(sawtooth(1, 2:end));

%(e)
A = diag(15:-1:1) + ones(15,15);

m = length(A); reduced_A = tridiag(A);
ew = zeros(1, m);
sawtooth = [0];
for i=1:m-1
    [newT, new_sawtooth] = qralg(reduced_A);
    sawtooth = [sawtooth, new_sawtooth];
    len = length(newT);
    ew(1, i) = newT(len, len);
    reduced_A = newT(1:len-1, 1:len-1);
end
ew(1, m) = newT(1,1); ew
figure;
semilogy(sawtooth(1, 2:end));

m = length(A); reduced_A = tridiag(A);
ew = zeros(1, m);
sawtooth = [0];
for i=1:m-1
    [newT, new_sawtooth] = Wqralg(reduced_A);
    sawtooth = [sawtooth, new_sawtooth];
    len = length(newT);
    ew(1, i) = newT(len, len);
    reduced_A = newT(1:len-1, 1:len-1);
end
ew(1, m) = newT(1,1); ew
figure;
semilogy(sawtooth(1, 2:end));


