function [ev, ew, count] = pw_ite(A, v)
% input : m*m real symmetric matrix A and initial vector v
% output : (usually) the largest eigenvalue, its eigenvector and iteration
% count
count = 0;
ev = v;
%sprintf("power_iteration")
while 1
    ew_previous = ev' * A * ev;
    ev = A * ev; ev = ev / norm(ev);
    ew = ev' * A * ev;
    if count <= 2
        sprintf("Iteration %d : %.8f", count+1, ew)
    end
    count = count + 1;
    if norm(ew - ew_previous) < 1e-12
       break 
    end
end
end