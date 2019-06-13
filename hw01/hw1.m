%%%%% 1-(a)

% Define inv3 and inv6 for convenience 
inv3 = 1 / sqrt(3);
inv6 = 1 / sqrt(6);

% Define A with pre-defined inv3 and inv6
A = [0, inv3 + inv3*i, inv6 - inv6*i;
    inv6 + inv3*i, -inv6*i, inv3;
    inv3 - inv6*i, inv6, inv3*i];

% calculate the inverse of A
inv(A)

%%%%% 1-(b)

% Calculate the multiplication of A and the hermitian of A which is equal
% to A' in matlab.

A*A'