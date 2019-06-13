function [r_list] = GMRES(A, n)
% input : Input matrix = A & # of iteration = n
% output : The list of relative residual ||r_n|| / ||b||  = r_list

[m, ~] = size(A); r_list = zeros(n, 1);
H = zeros(n+1, n); Q = zeros(m, n+1);
b = rand(m, 1); norm_b = norm(b);
Q(:, 1) = b / norm_b;

for i=1:n
   v = A * Q(:, i);
   for subix=1:i
      H(subix, i) = (Q(:, subix))'* v;
      v = v - H(subix, i) * Q(:, subix);
   end
   H(i+1, i) = norm(v);
   Q(:, i+1) = v / H(i+1, i);
   tmp = eye(n+1); e1 = norm_b * tmp(:, 1);
   y = H \ e1; x = Q(:, 1:n) * y;
   r_list(i, 1) = norm(b - A*x) / norm_b;
end
end

