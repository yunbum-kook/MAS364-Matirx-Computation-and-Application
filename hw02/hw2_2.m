%%%%% Problem 2 %%%%%
%%%%% 2-(1)

mat = zeros(15,40);
width = 5; height = 7;

% Filling the positions of each letter "H", "E", "L", "L", "O" by 1
for i=0:4
    % (x, y) coordinate of upper-left position of current letter
    x = 2+i; y = 2+i*8;
    mat(x:x+height, y:y+width) = 1;
end

% Change some portion of each letter block into 0
for i=0:4
    % (x, y) coordinate of upperleft position of current letter
    x = 2+i; y = 2+i*8;
    
    % Letter "H"
    if i==0
        mat(x:x+2, y+2:y+3)=0; mat(x+height-2:x+height, y+2:y+3)=0;
    % Letter "E"
    elseif i==1
        mat(x+2, y+2:y+width)=0; mat(x+height-2, y+2:y+width)=0;
    % Letter "L"
    elseif i==2
        mat(x:x+height-2, y+2:y+width)=0;
    % Letter "L"
    elseif i==3
        mat(x:x+height-2, y+2:y+width)=0;
    % Letter "O"
    else
        mat(x+2:x+height-2, y+2:y+width-2)=0;
    end
end

spy(mat)

%%%%% 2-(2)
% Obtain singular values of given matrix
sigmas = svd(mat)'
% Remove zero singular values (used only for neat graph of semilogy)
sigmas_refined = sigmas; sigmas_refined(rank(mat)+1 :end)=0;

figure;
subplot(1,3,1); plot(sigmas); title("Raw Singular Values");
subplot(1,3,2); semilogy(sigmas); title("Logarithms of singular values");
subplot(1,3,3); semilogy(sigmas_refined);
title("Logarithms of only nonzero singular values");

% Compute the rank of matrix
sprintf("The rank of 'HELLO' matrix is %d.", rank(mat))

%%%%% 2-(3)
[u, s, v] = svd(mat);

for i=1:rank(mat)
    approx_sigmas = diag(s); approx_sigmas(i+1:end)=0;
    ns = length(approx_sigmas);
    approx_s = s; approx_s(1:ns, 1:ns) = diag(approx_sigmas);
    
    low_matrix = u * approx_s * v';
    if i==1
        figure;
    elseif i==6
        figure;
    end
    
    if i<6
        subplot(rank(mat)/2, 1, i); pcolor(low_matrix); colormap(gray);
    elseif 5<i
        subplot(rank(mat)/2, 1, i-5); pcolor(low_matrix); colormap(gray);
    end
end

