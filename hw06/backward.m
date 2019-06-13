function [x] = backward(U, b)
m=size(b); x = b;

for i=m:-1:1
   for j=m:-1:i+1
       x(i) = x(i) - U(i,j) * x(j);
   end
   x(i) = x(i) / U(i,i); 
end
end

