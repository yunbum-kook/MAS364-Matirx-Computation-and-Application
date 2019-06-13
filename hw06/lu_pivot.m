function [P, L, U] = lu_pivot(A)
%Input : m x m matrix A
%Output : permutatuib matrix P
%         m x m matrices L(unit lower), U(upper)

[~, m] = size(A);
U=A; L=eye(m); P=eye(m);

for k=1:(m-1)
    tmp = U(k:m,k); [~, i] = max(abs(tmp)); i= i + (k-1);
    U([k i], k:m) = U([i k], k:m);
    L([k i], 1:k-1) = L([i k], 1:k-1);
    P([k i], :) = P([i k], :);
    for j=k+1:m
        L(j, k) = U(j, k) / U(k, k);
        U(j, k:m) = U(j, k:m) - L(j,k) * U(k,k:m);
    end
end

