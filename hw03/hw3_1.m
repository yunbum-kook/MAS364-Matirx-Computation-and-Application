%%%%% Problem 1 %%%%%
% Test mymgs
A1 = eye(3);
A2 = rand(3,2);

[q1,r1] = mgs(A1)
A1-q1*r1

[q2,r2] = mgs(A2)
A2-q2*r2