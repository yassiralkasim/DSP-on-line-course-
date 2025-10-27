clc
clear
close all

%% Fourier Series Demonstration for a Square Wave
% Parameters
T = 2 * pi; % Period of the square wave
w0 = 2 * pi / T; % Fundamental frequency
N = 2; % Number of Fourier coefficients (harmonics)
t = linspace(-T, T, 1000); % Time vector for plotting

% Original square wave (for comparison)
square_wave = square(t);

% Fourier series approximation
fourier_approx = zeros(size(t)); % Initialize approximation

% Calculate Fourier series terms
for k = 1:2:(2 * N - 1) % Only odd harmonics contribute to the square wave
    fourier_approx = fourier_approx + (4 / (k * pi)) * sin(k * w0 * t);
end

% Plot the results
figure(1);
plot(t, square_wave, 'b', 'LineWidth', 1.5); % Original square wave
hold on;
plot(t, fourier_approx, 'r', 'LineWidth', 1.5); % Fourier series approximation
title('Fourier Series Approximation of a Square Wave');
xlabel('Time');
ylabel('Amplitude');
legend('Original Square Wave', 'Fourier Approximation');
grid on;
hold off;

%% DTFT Demonstration

% Define the discrete-time signal
n = 0:15; % Time indices
x = sin(2 * pi * 0.1 * n); % Example signal: sine wave

% Define frequency range for DTFT
omega = linspace(-pi, pi, 1000); % Frequencies from -π to π
X = zeros(size(omega)); % Initialize DTFT result

% Compute the DTFT
for k = 1:length(omega)
    X(k) = sum(x .* exp(-1j * omega(k) * n)); % DTFT formula
end

% Magnitude and phase of DTFT
magnitude = abs(X);
phase = angle(X);

% Plotting the results
figure(2);

% Magnitude spectrum
subplot(2, 1, 1);
plot(omega, magnitude, 'b', 'LineWidth', 1.5);
title('Magnitude Spectrum of DTFT');
xlabel('Frequency (\omega)');
ylabel('|X(\omega)|');
grid on;

% Phase spectrum
subplot(2, 1, 2);
plot(omega, phase, 'r', 'LineWidth', 1.5);
title('Phase Spectrum of DTFT');
xlabel('Frequency (\omega)');
ylabel('Phase \angle X(\omega)');
grid on;

%% DFT Demonstration

% Define the discrete-time signal
n = 0:7; % Time indices
x = [1, 2, 3, 4, 2, 1, 0, 0]; % Example signal

% Compute the DFT
N = length(x); % Number of points in the DFT
X = zeros(1, N); % Initialize DFT result

for k = 1:N
    for m = 1:N
        X(k) = X(k) + x(m) * exp(-1j * 2 * pi * (k-1) * (m-1) / N);
    end
end

% Compute the frequency axis
frequencies = (0:N-1) / N;

% Magnitude and phase of the DFT
magnitude = abs(X);
phase = angle(X);

% Plotting the results
figure(3);

% Magnitude spectrum
subplot(2, 1, 1);
stem(frequencies, magnitude, 'b', 'LineWidth', 1.5);
title('Magnitude Spectrum of DFT');
xlabel('Normalized Frequency');
ylabel('|X[k]|');
grid on;

% Phase spectrum
subplot(2, 1, 2);
stem(frequencies, phase, 'r', 'LineWidth', 1.5);
title('Phase Spectrum of DFT');
xlabel('Normalized Frequency');
ylabel('Phase \angle X[k]');
grid on;


%% Circular Convolution 
x = [2, 1, 2, 1];
h = [1, 2, 3, 4];
y = conv(x, h);
disp('actual y = ')
disp(y)
% Using DFT without zero padding
X = fft(x);
H = fft(h);
Y = X .* H;
y = ifft(Y);
disp('y without zero padding = ')
disp(y)
% Using DFT with zero padding
x = [2, 1, 2, 1, 0, 0, 0];
h = [1, 2, 3, 4, 0, 0, 0];
X = fft(x);
H = fft(h);
Y = X .* H;
y = ifft(Y);
disp('y with zero padding = ')
disp(y)