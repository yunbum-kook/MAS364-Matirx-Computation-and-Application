%%%%% Problem 1 %%%%%
% matrix in (3.7)
m3 = [1, 2; 0, 2];

% matrices in Exercise 4.1
m41 = [3, 0; 0, -2];
m42 = [2, 0; 0, 3];
m43 = [1,1; 0,0];
m44 = [1,1; 1,1];

figure;

% plot a unit circle with the right singular vectors
% and an ellipse with the left singular vectors.
transformation(m3, 1);
transformation(m41, 2);
transformation(m42, 3);
transformation(m43, 4);
transformation(m44, 5);