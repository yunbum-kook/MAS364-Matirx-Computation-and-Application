%%%%% Problem 4 %%%%%
%%%%% 4-(1)

% Convert kaist.jpg from rgb2 to gray 
kaist = rgb2gray(imread('kaist.jpg'));
kaist = im2double(kaist);
tmp = size(kaist); row = tmp(1); col = tmp(2);

% Apply svd to kaist
[u,s,v] = svd(kaist);
diag_s = diag(s);

% Rank approximation 
low_rank_ar3ray = zeros(row, col, 3); 
ranks = [25, 50, 100];
figure;

for n=1:3
    low_diag = diag_s; low_diag(ranks(n)+1:end)=0;
    low_s = s; low_s(1:length(diag_s), 1:length(diag_s)) = diag(low_diag);
    
    low_kaist = u * low_s * v';
    low_rank_array(:,:,n) = low_kaist;
    
    subplot(2,2,n), imshow(low_kaist);
    title(sprintf('Rank %d KAIST', ranks(n)));
end
subplot(2,2,4), imshow(kaist), title('Original KAIST');

%%%%% 4-(2)
original_norm = norm(kaist, 'fro');

for n=1:3
    rel_error = norm(kaist-low_rank_array(:,:,n), 'fro')/original_norm;
    sprintf("Relative Error when Rank-%d approximation : %f", ...
    ranks(n), rel_error)
end

%%%%% 4-(3)
for n=1:3
    comp_rate = ranks(n)*(1+row+col)/(row*col);
    sprintf("Compression Rate when Rank-%d approximation : %f", ...
    ranks(n), comp_rate)
end