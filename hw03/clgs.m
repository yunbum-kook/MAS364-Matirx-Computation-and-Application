function [Q, R] = clgs(A)
% Input : m*n matrix A
% Output : [Q, R] where m*n matrix Q and n*n matrix R

[m ,n] = size(A);
Q = zeros(m,n);
R = zeros(n);

for j=1:n
    vj = A(:,j);
    for i=1:j-1
        R(i,j) = Q(:,i)' * A(:,j);
        vj = vj - R(i,j) * Q(:,i);  
    end
    R(j,j) = norm(vj);
    Q(:,j) = vj / R(j,j);
end
end