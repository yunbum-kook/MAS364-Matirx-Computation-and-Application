%%%%% Problem 1 %%%%%
A = randn(100, 100)/sqrt(100);
A(1,1) = 1.5;
A_ew = eig(A);

%(a)
figure;
hold on;
fimplicit(@(x,y) x.^2 + y.^2 - 1)
plot(A_ew, '*');
hold off;

for it=1:8
    [H, b] = Arnoldi(A, it);
    H_ew = eig(H); coeff = charpoly(H);
    acc = zeros(100, 1);
    for i=1:(it+1)
       acc = acc + (coeff(i) * A^(it + 1 - i))*b;
    end
    C = norm(acc) / norm(b);
    
    ftn = @(x,y) 0; gtn = @(x,y) 0;
    for index=1:(it+1)
        addftn = @(x,y) (coeff(index).*(x+j.*y).^(it+1-index));
        addgtn = @(x,y) (coeff(index).*(x-j.*y).^(it+1-index));
        ftn = @(x,y) (ftn(x,y) + addftn(x,y));
        gtn = @(x,y) (gtn(x,y) + addgtn(x,y));
    end
    fin = @(x,y) real(ftn(x,y) .* gtn(x,y)-C^2);
    figure;
    fimplicit(fin)
    
    hold on;
    plot(H_ew, 'o');
    plot(A_ew, '*');
    hold off;
end


%(b)
m = 200; A = 2*eye(m) + 0.5*randn(m)/sqrt(m);
A_ew = eig(A);

%Fig 35.2
figure;
hold on;
plot(A_ew, '*');
fimplicit(@(x,y) (x-2).^2 + y.^2 - 1/4)
hold off;

%Fig 35.3
r_list = GMRES(A, 10);
figure;
semilogy(r_list, '*')

%Fig 35.4
dig = zeros(m, 1);
for i=1:m
   angle = (i-1)*pi / (m-1);
   dig(i, 1) = (-2 + 2*sin(angle)) + j*cos(angle);
end
D = diag(dig); newA = A + D; A_ew = eig(newA);
figure;
plot(A_ew, '*');

%Fig 35.5
r_list = GMRES(newA, 10);
figure;
semilogy(r_list, '*')
ylim([1E-6, 10])

