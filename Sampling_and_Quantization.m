clc
clear 
close all
%% Sampling theory
% Define time vector for the analog signal
% t = linspace(0, 1, 1000); % 1000 points between 0 and 1
% f = 5; % Frequency of the signal (Hz)
% x = sin(2 * pi * f * t); % Analog signal
% 
% % Sampling frequency
% fs = 50; % Sampling frequency (Hz)
% 
% % Define sample points
% n_samples = 0:1/fs:1-1/fs; % Sample times
% x_n = sin(2 * pi * f * n_samples); % Sampled signal
% 
% % Plotting
% figure(1);
% plot(t, x, 'b', 'LineWidth', 1.5); % Plot analog signal
% hold on;
% stem(n_samples, x_n, 'r', 'filled', 'LineWidth', 1.5); % Plot sampled signal
% title('Sampling Theory Demonstration');
% xlabel('Time (s)');
% ylabel('Amplitude');
% legend('Analog Signal', 'Sampled Signal');
% grid on;
% hold off;

%% Quantization
% Define time vector
t = linspace(0, 1, 1000); % 1000 points between 0 and 1
f = 1; % Frequency of the signal (Hz)
x = sin(2 * pi * f * t); % Analog signal

% Quantization parameters
quan_levels = 16; % Number of quantization levels
q_x = round(x * (quan_levels / 2)) / (quan_levels / 2); % Quantized signal

% Plotting
figure;
plot(t, x, 'b', 'LineWidth', 1.5); % Plot analog signal
hold on;
stairs(t, q_x, 'r', 'LineWidth', 1.5); % Plot quantized signal
title('Quantization of Analog Signal');
xlabel('Time (s)');
ylabel('Amplitude');
legend('Analog Signal', 'Quantized Signal');
grid on;
hold off;
