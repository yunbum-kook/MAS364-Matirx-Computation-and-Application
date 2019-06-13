function [H, init] = Arnoldi(A, n)
% input : Input matrix = A & # of iteration = n
% output : H_n (Upperleft n x n submatrix of Hessenberg of A)
%           initial vector = init

[m, ~] = size(A);
H = zeros(n+1, n); Q = zeros(m,n+1);
b = rand(m, 1); Q(:,1) = b / norm(b); init = Q(:,1);

for i=1:n
   v = A * Q(:,i);
   for subix=1:i
      H(subix, i) = (Q(:, subix))'* v;
      v = v - H(subix, i) * Q(:, subix);
   end
   H(i+1, i) = norm(v);
   Q(:, i+1) = v / H(i+1, i);
end
H = H(1:n, 1:n);
end

