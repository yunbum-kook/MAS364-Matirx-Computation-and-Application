function Q = formQ(W)
% Input : m*n matrix W produced by house
% Output : m*m orthogonal matrix Q

% Use Algorithm 10.3 for x = e_1, ..., e_n
[m, n] = size(W);
Q = eye(m);
for k=n:-1:1
    for i=1:m
       Q(k:m,i) = Q(k:m,i) - 2 * W(k:m,k) * (W(k:m,k)' * Q(k:m,i));
    end
end
end

