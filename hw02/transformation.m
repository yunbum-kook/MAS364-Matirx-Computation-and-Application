% function which draws two subplots; circle on left & ellipse on right
function transformation(mat, count)
t=0 : pi/100 : 2*pi;
xcircle = cos(t);
ycircle = sin(t);

circle_mat = [xcircle; ycircle];
% Each column of 'ellipse' corresponds to a point in image of circle
ellipse = mat * circle_mat;
xellipse = ellipse(1, :);
yellipse = ellipse(2, :);

[u, s, v] = svd(mat);
s = diag(s);

% Draw circle on the left side
subplot(5, 2, 2*count-1); plot(xcircle, ycircle);
% Mark the right singular vectors
hold on
plot(v(1,1), v(2,1), 'r*');
plot(v(1,2), v(2,2), 'r*');
hold off

% Draw ellipse on the right side
subplot(5, 2, 2*count); plot(xellipse, yellipse);
% Mark the left singular vectors
hold on
plot(s(1)*u(1,1), s(1)*u(2,1), 'r*');
plot(s(2)*u(1,2), s(2)*u(2,2), 'r*');
hold off
end