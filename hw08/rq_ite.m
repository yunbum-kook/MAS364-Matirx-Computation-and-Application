function [ev, ew, count] = rq_ite(A, v, mu)
% input : m*m real symmetric matrix A,
%         initial vector v and mu
% output : (usually) the largest eigenvalue, its eigenvector and iteration
% counter
[~, m] = size(A); count = 0;
ev = v / norm(v); ew = mu;
%sprintf("rayleigh_quotient_iteration")
while 1
    ew_previous = ew;
    ev = (A-ew * eye(m))\ev;
    ev = ev / norm(ev);
    ew = ev' * A * ev;
    if count <= 3
        sprintf("Iteration %d : %.8f", count+1, ew)
    end
    count = count + 1;
    if norm(ew - ew_previous) < 1e-12
       break 
    end
end
end