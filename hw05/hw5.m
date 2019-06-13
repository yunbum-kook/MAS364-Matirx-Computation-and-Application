%%%%% Exercise 12.1 %%%%%
% (a)
% What do eigenvalues of a random matrix look like?
A = randn(32,32)/sqrt(32);
plot(abs(eig(A)),'.')

% Superimpose all eigenvalues in a single plot for m = 8, 16, 32, 64
dim = [8, 16, 32, 64];

figure;
for d=1:4
    subplot(2,2,d); title(sprintf("Eigenvalues under m=%d",dim(d)));
    hold on
    for i=1:100
       A = randn(dim(d))/sqrt(dim(d));
       plot(abs(eig(A)),'.')
    end
    hold off
end

% Pattern of spectral norm(the largest eigenvalue) as m increases
figure;
spectral = zeros(1,100);
for i=1:100
    A = randn(10*i) / sqrt(10*i);
    eigen = eig(A); radius = abs(eigen(1));
    spectral(i) = radius;
end

plot([10:10:1000],spectral,'.'); title("Spectral Radius from m=1 to 1000")

%(b)

figure;
norm2 = zeros(100,1);
sm_sig = zeros(100,1);
percent = zeros(100,1);
for i=10:10:1000
    A = randn(i) / sqrt(i);
    eigen = eig(A); radius = abs(eigen(1));
    norm2(i/10) = norm(A);
    sm_sig(i/10) = svds(A,1,'smallest');
    percent(i/10) = radius / norm2(i/10);
end


subplot(1,2,1);
plot([10:10:1000], norm2, '.'); title("2-norm of random matrices");
subplot(1,2,2);
plot([10:10:1000], percent, '.'); title("Spctral radius / 2-Norm");

% (c)
% Pattern of the smalles singular values as m increases
figure;
plot([10:10:1000], sm_sig, '.'); title ("The smallest singular values")

% Fix m=10. Examine the tail of the probability distribution of smallest
% singular values.
sm_sigs = zeros(1000,1);
for i=1:1000
    A = randn(30) / sqrt(30);
    sm_sigs(i) = svds(A,1,'smallest');
end

prop = zeros(100,1);
for i=1:100
   prop(i) = sum(sm_sigs < 1 / 2^i)/1000;
end
figure;
plot(prop,'.');

% Refined experiments
prop = zeros(1000,1);
for i=1:1000
   prop(i) = sum(sm_sigs < 1 / (3*i))/1000;
end
figure;
plot(prop,'.');

% Trial for various sizes
figure;
sm_sigs = zeros(300,4);
for i=1:300
    A = randn(30) / sqrt(30);
    B = randn(60) / sqrt(60);
    C = randn(100) / sqrt(100);
    D = randn(300) / sqrt(300);
    sm_sigs(i,1) = svds(A,1,'smallest');
    sm_sigs(i,2) = svds(B,1,'smallest');
    sm_sigs(i,3) = svds(C,1,'smallest');
    sm_sigs(i,4) = svds(D,1,'smallest');
end

prop = zeros(1000,4);
for i=1:1000
   prop(i,1) = sum(sm_sigs(:,1) < 1 / (3*i))/300;
   prop(i,2) = sum(sm_sigs(:,2) < 1 / (3*i))/300;
   prop(i,3) = sum(sm_sigs(:,3) < 1 / (3*i))/300;
   prop(i,4) = sum(sm_sigs(:,4) < 1 / (3*i))/300;
end

size = [30,60, 100, 300];
for i=1:4
   subplot(2,2,i);
   plot(prop(:,i), '.'); title(sprintf("Size : %d", size(i)));
end

