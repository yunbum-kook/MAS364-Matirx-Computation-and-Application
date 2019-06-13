function [W, R] = house(A)
% Input : m*n matrix A
% Output : m*n lower triangular matrix W & n*n triangular matrix R

[m, n] =size(A);
W = zeros(m, n);

for k=1:n
   tmp = eye(m-k+1); e1 = tmp(:,1);
   x = A(k:m,k);
   vk = sign(x(1)) * norm(x) * e1 + x;
   W(k:m, k) = vk / norm(vk);
   
   A(k:m, k:n) = A(k:m, k:n) - 2 * W(k:m,k) * (W(k:m,k)'* A(k:m, k:n));
end
R = A(1:n,:);
end

