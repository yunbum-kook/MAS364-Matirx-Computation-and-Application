function shift = Wikinson(M)
% input : 2 x 2 matrix M
d = (M(1, 1) - M(2,2))/2;
sgn = sign(d);
if d == 0
    sgn = 1;
end
denom = abs(d)+sqrt(d^2+M(2,1)^2);
shift = M(2,2)-sgn*M(2,1)^2/denom;
end

