%%%%% Problem 2 %%%%%
% Test my house (compare with bulit-in qr function)

A1 = rand(4,3);

% (a)
[Wh, Rh] = house (A1);
[Qm, Rm] = qr (A1); 
Rh
Rm

% (b)
Qh = formQ(Wh)
Qm