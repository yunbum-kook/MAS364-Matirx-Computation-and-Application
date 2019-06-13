function [x] = forward(L, b)
m=size(b); x = b;

for i=1:m
   for j=1:i-1
       x(i) = x(i) - L(i,j) * x(j);
   end
   x(i) = x(i) / L(i,i); 
end
end

