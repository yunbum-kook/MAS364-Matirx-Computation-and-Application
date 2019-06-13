function [R] = chole(A)
%Input : m x m symmetric hermitian matrix A
%Output : m x m upper matrices 
[~, m] = size(A);
index = tril(true(m), -1); R=A; R(index)=0;

for k=1:m
    R(k,k:m) = R(k,k:m)/sqrt(R(k,k));
    for j=k+1:m
       R(j, j:m) = R(j, j:m) - R(k,j)'*R(k,j:m);
    end
end

