%%%%% Problem 1 %%%%%
% (a) Codes for LU w/ (w/o) pivoting, Cholesky
% Test for the algorithm
A=rand(3,3);

[L1, U1] = lu_nopivot(A);
[P, L2, U2] = lu_pivot(A);
[R] = chole(A'*A);

A
L1*U1
inv(P)*L2*U2

A'*A
R'*R

% (b)
power = [10, 30, 60];

for i=1:3
    sprintf("For e=10^(-%d)", power(i))
    e=10^(-power(i));
    A=[e,1,0; 1,1,e; 0,1,3*e]; b=[1+e; 2+e; 1+3*e];
    [l1,u1]=lu_nopivot(A); [p,l2,u2]=lu_pivot(A);
    %Compare the results of LU with the given matrix A
    A
    l1*u1
    inv(p)*l2*u2
    
    %Solve the equation:Ly=b and Ux=y
    y = forward(l1, b); 
    x = backward(u1, y)
    
    yp = forward(l2, p*b);
    xp = backward(u2, yp)
end

% (c)
m=1000; z=randn(m,m); A=z'*z; b=randn(m,1);

% LU with partial pivoting
for i=1:3
    tic
    [p,l,u] = lu_pivot(A);
    yp = linsolve(l, p*b, struct('LT', true));
    xp = linsolve(u, yp, struct('UT', true));
    toc
end

for i=1:3
    tic
    [r] = chole(A);
    y = linsolve(r', b, struct('LT', true));
    x = linsolve(r, y, struct('UT', true));
    toc
end