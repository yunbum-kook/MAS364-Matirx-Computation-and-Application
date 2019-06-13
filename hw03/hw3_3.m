%%%%% Problem 3 %%%%%

[U,X] = qr(rand(80)); [V,X] = qr(rand(80));
S = diag(2.^(-1:-1:-80));
A = U*S*V;

[QC, RC] = clgs(A); rc = diag(RC);
[QM, RM] = mgs(A); rm = diag(RM);
[WH, RH] = house(A); rh = diag(abs(RH));

semilogy(rc, '-o');
ylim([1E-25 1]);
hold on;
semilogy(rm,'-*');
semilogy(rh,'-x');
hold off;