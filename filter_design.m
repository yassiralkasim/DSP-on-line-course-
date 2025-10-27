% Define parameters
fs = 1000;          % Sampling frequency (Hz)
t = 0:1/fs:1;       % Time vector (1 second duration)
f = 5;              % Frequency of the sine wave (Hz)
amplitude = 1;      % Amplitude of the sine wave

% Generate the sine wave
x = amplitude * sin(2 * pi * f * t);

% Add Gaussian noise
noise_amplitude = 0.3; % Adjust noise strength
noise = noise_amplitude * randn(size(t));
x_noisy = x + noise;

% Design a FIR low-pass filter
filter_order_fir = 5;  % Order of the FIR filter
cutoff_frequency_fir = 0.1; % Normalized cutoff frequency (0.1 * Nyquist frequency)
b_fir = fir1(filter_order_fir, cutoff_frequency_fir, 'low', hamming(filter_order_fir + 1)); % FIR coefficients

% Apply the FIR filter to the noisy signal
x_fir_filtered = filter(b_fir, 1, x_noisy);

% Design an IIR Butterworth low-pass filter
filter_order_iir = 4; % Order of the IIR filter
cutoff_frequency_iir = 0.1; % Normalized cutoff frequency
[b_iir, a_iir] = butter(filter_order_iir, cutoff_frequency_iir, 'low'); % IIR coefficients

% Apply the IIR filter to the noisy signal
x_iir_filtered = filter(b_iir, a_iir, x_noisy);

% Plot the original noisy signal, FIR filtered signal, and IIR filtered signal
figure;

% Plot the noisy sine wave
subplot(4, 1, 1);
plot(t, x_noisy, 'r', 'LineWidth', 1.5);
title('Noisy Sine Wave');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Plot the FIR filtered sine wave
subplot(4, 1, 2);
plot(t, x_fir_filtered, 'g', 'LineWidth', 1.5);
title('FIR Filtered Sine Wave');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Plot the IIR filtered sine wave
subplot(4, 1, 3);
plot(t, x_iir_filtered, 'm', 'LineWidth', 1.5);
title('IIR Filtered Sine Wave');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Plot the original clean sine wave for comparison
subplot(4, 1, 4);
plot(t, x, 'b', 'LineWidth', 1.5);
title('Original Sine Wave');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Adjust the figure
sgtitle('FIR and IIR Filter Design and Application');
