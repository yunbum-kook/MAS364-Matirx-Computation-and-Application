function [H] = Hessenberg(A, inter)
% If inter = 1, then it prints out all intermediate results during loop
% If inter = 0, it only returns new matrix in Hessenberg form
[~, m] =size(A);

for k=1:m-2
   tmp = eye(m-k); e1 = tmp(:,1);
   x = A(k+1:m,k);
   vk = sign(x(1)) * norm(x) * e1 + x;
   vk = vk / norm(vk);
   
   A(k+1:m, k:m) = A(k+1:m, k:m) - 2 * vk * (vk'* A(k+1:m, k:m));
   if inter==1
       A
   end
   A(1:m, k+1:m) = A(1:m, k+1:m) - 2 * (A(1:m, k+1:m) * vk) * vk';
   if inter==1
       A
   end
end
H=A;
end