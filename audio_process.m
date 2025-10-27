clc
clear
close all

% Load the audio file
[audio_signal, fs] = audioread('sample.wav'); % Replace 'example.wav' with your file path
% Time vector
t = (0:length(audio_signal)-1) / fs; % Time in seconds

% Plot the time-domain signal
figure;
subplot(2, 1, 1);
plot(t, audio_signal, 'b', 'LineWidth', 1.5);
title('Time-Domain Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Frequency-domain representation (Fourier Transform)
N = length(audio_signal); % Number of samples
f = linspace(-fs/2, fs/2, N); % Frequency axis
audio_fft = fftshift(fft(audio_signal)); % FFT and shift for centered frequency

% Plot the magnitude spectrum
figure;
subplot(2, 1, 2);
plot(f, abs(audio_fft), 'r', 'LineWidth', 1.5);
title('Frequency-Domain Signal');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;

% Adjust layout
sgtitle('Audio Signal Analysis');

% Generate the noise signal at 1500 Hz
noise_frequency = 1500; % Frequency of the noise (Hz)
noise_amplitude = 0.1; % Adjust noise strength as needed
noise_signal = noise_amplitude * sin(2 * pi * noise_frequency * t'); % Noise (column vector)
% Add the noise to the audio signal
noisy_signal = audio_signal + noise_signal;
figure;
% Noisy Signal
subplot(2, 1, 1);
plot(t, noisy_signal, 'r', 'LineWidth', 1.5);
title('Noisy Time-Domain Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
% Frequency-domain representation (Fourier Transform)
N = length(audio_signal); % Number of samples
f = linspace(-fs/2, fs/2, N); % Frequency axis

% FFT of noisy signal
noisy_fft = fftshift(fft(noisy_signal));

% Plot the frequency-domain representation of the noisy signal
subplot(2, 1, 2);
plot(f, abs(noisy_fft), 'g', 'LineWidth', 1.5);
title('Noisy Frequency-Domain Signal');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;

% Adjust layout
sgtitle('Audio Signal with Added Noise Analysis');