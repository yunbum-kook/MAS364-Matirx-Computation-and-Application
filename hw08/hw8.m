%%%%% Problem 1 %%%%%
A = [2 1 1; 1 3 1; 1 1 4];

% (b)
[V, D] = eig(A)

% (c)
v = [1, 1, 1]' / sqrt(3);
mu = v' * A * v;

[pw_ev, pw_ew, pw_count] = pw_ite(A, v);
[inv_ev, inv_ew, inv_count] = inv_ite(A, v, mu);
[rq_ev, rq_ew, rq_count] = rq_ite(A, v, mu);

%(d)
sprintf("Power Iteration")
tic
it_count=0; S=A;
for i=1:3
    [pw_ev, pw_ew, pw_count] = pw_ite(S, v);
    S = S - pw_ew * pw_ev * pw_ev';
    it_count = it_count + pw_count;
    pw_ew
end
it_count
toc

sprintf("Inverse Iteration")
tic
mu = v'*A*v; it_count = 0; S = A;
for i=1:3
    [inv_ev, inv_ew, inv_count] = inv_ite(S, v, mu);
    S = S - inv_ew * inv_ev * inv_ev';
    it_count= it_count + inv_count;
    inv_ew
end
it_count 
toc

sprintf("Rayleigh Quotient Iteration")
tic
it_count = 0; S = A;
mu=[1,2,3];
for i=1:3
    [rq_ev, rq_ew, rq_count] = rq_ite(S, v, mu(i));
    S = S - rq_ew * rq_ev * rq_ev';
    it_count= it_count + rq_count;
    rq_ew
end
it_count
toc
