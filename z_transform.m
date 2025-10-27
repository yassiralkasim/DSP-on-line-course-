clc
clear 
close all
% Z-Transform Demonstration

% Step 1: Define the signal
syms z n
x = (0.5)^n; % Example signal: x[n] = 0.5^n

% Step 2: Compute the Z-transform
X = ztrans(x, n, z); % Z-transform of x[n]
disp('Z-Transform of x[n]:');
disp(X);

% Step 3: Analyze the Z-transform (Poles and Zeros)
% Define numerator and denominator
a = -0.5; b = 0; % Convert symbolic expression to transfer function coefficients
disp('Numerator Coefficients:');
disp(b);
disp('Denominator Coefficients:');
disp(a);

% Step 4: Plot Poles and Zeros
figure;
zplane(b, a); % Plot pole-zero plot
title('Pole-Zero Plot of the Z-Transform');

% Step 5: Compute the Inverse Z-transform
x_reconstructed = iztrans(X, z, n); % Inverse Z-transform
disp('Reconstructed Signal x[n]:');
disp(x_reconstructed);


