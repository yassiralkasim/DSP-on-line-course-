% 
clc
clear
close all

%% Analog Signal
% Define time
t = 0:0.001:1;
% % Define frequency
% f = 5; % Hz
% % Define analog signal
% analog_signal = sin(2*pi*f*t);
% % plotting 
% figure(1);
% plot(t, analog_signal)
% title('Analog Signal')
% xlabel('Time (s)')
% ylabel('Amplitude')
% grid

%% Digital Signal
% % Define n time index
% n = 0:0.02:1;
% % Define digital signal
% digital_signal = sin(2*pi*f*n);
% % plotting
% figure(2);
% stem(n, digital_signal)
% title('Digital Signal')
% xlabel('Time index')
% ylabel('Amplitude')
% grid
% 
%% Time shift
% Original Signal x(t)
% f_or = 2; % F = 2 Hz
% x = sin(2*pi*f_or*t);
% Shifted signal x(t-shift)
% shift = 0.1;
% shifted_x = sin(2*pi*f_or*(t - shift));
% Plotting
% figure(3);
% plot(t, x, 'r')
% hold on
% plot(t, shifted_x, 'k')
% title('Time Shift')
% xlabel('Time (s)')
% ylabel('Amplitude')
% legend('Orignial', 'Shifted')
% grid
% hold off

% %% Time Scaling
% t_sc = -1:0.001:1;
% f_sc = 2; % Frequency f = 2 Hz
% % Original Signal x(t)
% x_sc = sin(2*pi*f_sc*t_sc);
% % Scaled Signal x(scale*t)
% scale = 0.5;
% scaled_x = sin(2*pi*f_sc*(t_sc*scale));
% % plotting
% figure(4);
% plot(t_sc, x_sc, 'r')
% hold on
% plot(t_sc, scaled_x, 'k')
% title('Time Scaling')
% xlabel('Time (s)')
% ylabel('Amplitude')
% legend('Original', 'Scaled')
% grid
% hold off

%% Time Folding
t_f = -1:0.001:1;
f_f = 0.5;
x_f = sin(2*pi*f_f*t_f);
folded_x = sin(2*pi*f_f*(-t_f));
% plotting
figure(5);
plot(t_f, x_f, 'r')
hold on
plot(t_f, folded_x, 'k')
title('Time Folding')
xlabel('Time (s)')
ylabel('Amplitude')
legend('Original', 'Folded')
grid
hold off