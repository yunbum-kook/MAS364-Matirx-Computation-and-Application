function T = tridiag(A)
m = length(A);

for k=1:m-2
   tmp = eye(m-k); e1 = tmp(:,1);
   x = A(k+1:m,k);
   vk = sign(x(1)) * norm(x) * e1 + x;
   vk = vk / norm(vk);
   
   A(k+1:m, k:m) = A(k+1:m, k:m) - 2 * vk * (vk'* A(k+1:m, k:m));
   A(1:m, k+1:m) = A(1:m, k+1:m) - 2 * (A(1:m, k+1:m) * vk) * vk';
end

for k=1:m-1
    A(k+2:m, k) = 0;
    A(k, k+1:m) = A(k+1:m, k)';
end
T = A;
end