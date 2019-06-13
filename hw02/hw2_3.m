%%%%% Problem 3 %%%%%
%%%%% 3-(1)

% Change working directory
cd '/Users/Kook/Desktop/mat_workspace/hw2';
load('Check.mat');
figure; imshow(Check);

%%%%% 3-(2)

% Apply SVD to Check matrix
[u,s,v] = svd(Check);
s = diag(s);

% Save u, s, v as mat files
save('Check_u.mat', 'u');
save('Check_s.mat', 's');
save('Check_v.mat', 'v');

% Calculate smalles amount of data needed in this method
comp_entry = rank(Check) * (1 + 2 * length(s));
sprintf("In total, %d entries are required.", comp_entry)
sprintf("Compression rate is %f.", comp_entry/3600)

%%%%% 3-(3)
load('Check_u.mat');
load('Check_s.mat');
load('Check_v.mat');

frame = zeros(60);
for n=1:60
    frame = frame + s(n)*u(:,n)*v(:,n)';
end
figure; imshow(frame);