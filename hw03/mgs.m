function [Q,R] = mgs(A)
% Input : m*n matrix A
% Output : [Q, R] where m*n matrix Q and n*n matrix R

[m ,n] = size(A);
Q = A;
R = zeros(n);

for i=1:n
    vi = Q(:,i);
    R(i,i) = norm(vi);
    Q(:,i) = vi / R(i,i);
    for j=i+1:n
       vj = Q(:,j);
       R(i,j) = Q(:,i)' * vj;
       Q(:,j) = vj - R(i,j) * Q(:,i);
    end
end
end