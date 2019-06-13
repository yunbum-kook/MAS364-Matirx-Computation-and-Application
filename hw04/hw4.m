%%%%% Problem 1 %%%%%
% setup
m = 50; n = 12;
t = linspace(0,1,m); A = fliplr(vander(t)); A = A(:,1:n);
b = cos(4*t); b = b';

% (a)
xnormal = (A'*A)\(A'*b)

% (b)
[q,r] = mgs(A);
xmgs = r\(q'*b)

% (c)
[w,r] = house(A);
q = formQ(w); q = q(:,1:n);
xhouse = r\(q'*b)

% (d)
[q,r] = qr(A); q = q(:,1:n); r = r(1:n,:);
xqr = r\(q'*b)

% (e)
xlsq = A\b

% (f)
[u,s,v] = svd(A);
xsvd = v*(s\(u'*b))