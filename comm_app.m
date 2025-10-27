clc
clear
close all

% Parameters
bit_count = 16; % Number of bits
bit_rate = 1e3; % Bit rate (bits per second)
sampling_rate = 1e5; % Sampling rate (samples per second)
carrier_frequency = 2e3; % Carrier frequency (Hz)

T_bit = 1 / bit_rate; % Bit duration
samples_per_bit = round(sampling_rate * T_bit); % Samples per bit
t = linspace(0, bit_count * T_bit, bit_count * samples_per_bit); % Time vector

% Generate random binary data
rng(0); % Seed for reproducibility
data_bits = randi([0, 1], 1, bit_count); % Random binary data

% Map binary data to BPSK symbols (-1 and 1)
bpsk_symbols = 2 * data_bits - 1;

% Create BPSK waveform
bpsk_waveform = repelem(bpsk_symbols, samples_per_bit);

% Generate carrier signal
carrier = cos(2 * pi * carrier_frequency * t);

% BPSK modulated signal
bpsk_signal = bpsk_waveform .* carrier;

% Plot the binary data
subplot(3, 1, 1);
stairs(0:bit_count-1, data_bits, 'LineWidth', 1.5); % Plot binary data
title('Binary Data');
xlabel('Bit Index');
ylabel('Amplitude');
ylim([-0.5, 1.5]);
grid on;

% Plot the BPSK waveform
subplot(3, 1, 2);
plot(t, bpsk_waveform, 'LineWidth', 1.5); % Plot BPSK waveform
title('BPSK Waveform');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Plot the BPSK modulated signal
subplot(3, 1, 3);
plot(t, bpsk_signal, 'LineWidth', 1.5); % Plot BPSK modulated signal
title('BPSK Modulated Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

%%
% Define the input signal
x = [1; 0; 1]; % Input signal as a column vector

% Define the generator polynomials
g1 = [1 1 1]; % Generator 1
g2 = [1 0 1]; % Generator 2
generators = [7, 5]; % Generator polynomials in octal form (binary: g1=111, g2=101)

% Define the convolutional encoder
trellis = poly2trellis(3, generators); % Constraint length = 3, generators in octal
convEncoder = comm.ConvolutionalEncoder(trellis);

% Encode the signal
encoded_signal = convEncoder(x);

% Display results
disp('Input Signal:');
disp(x');
disp('Encoded Output:');
disp(encoded_signal');

% Plot the results
figure;
subplot(2, 1, 1);
stem(0:length(x)-1, x, 'b', 'LineWidth', 1.5);
title('Input Signal');
xlabel('Bit Index');
ylabel('Amplitude');
grid on;

subplot(2, 1, 2);
stem(0:length(encoded_signal)-1, encoded_signal, 'r', 'LineWidth', 1.5);
title('Encoded Signal');
xlabel('Bit Index');
ylabel('Amplitude');
grid on;

% Adjust the layout
sgtitle('BPSK Modulation Demonstration');

%% PRN codes Parameters
n = 10; % Length of the PRN code
polynomial = [1 0 1 1]; % Generator polynomial (example: x^3 + x + 1)
initial_conditions = [1 0 0]; % Initial state (non-zero)

% Create PRN generator
pn_generator = comm.PNSequence('Polynomial', polynomial, ...
                               'InitialConditions', initial_conditions, ...
                               'SamplesPerFrame', n);

% Generate PRN code
prn_code = pn_generator();
% prn_code = 2 * prn_code - 1;
% Display and plot the PRN code
disp('Generated PRN Code:');
disp(prn_code');

figure;
stem(1:n, prn_code, 'b', 'LineWidth', 1.5);
title('Generated PRN Code Using comm.PNSequence');
xlabel('Index');
ylabel('Amplitude');
grid on;

Rxx = xcorr(prn_code);
figure;
plot(Rxx)
grid