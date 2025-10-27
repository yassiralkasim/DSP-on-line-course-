clc
clear
close all

% Convolution
x = [1, 2, 3, 1];
h = [1, 2, 1, -1];
% 
% y = conv(x, h)
% length_y = length(y)

%% Commutative law
% x * h = h * x
% y1 = conv(x, h)
% y2 = conv(h, x)


%% Associative law
% x * (h1 * h2) = (x * h1) * h2
h1 = [1, 0, -1];
h2 = [2, 1];
% y1 = conv(x, conv(h1, h2))
% y2 = conv(conv(x, h1), h2)

%% Distributive law
% x * (h1 + h2) = (x * h1) + (x + h2)
% y1 = conv(x, (h1 + [h2 0]))
% y2 = conv(x, h1)
% y3 = conv(x, h2)

% Define the input and output signals
% x = ones(1, 10);  % Example input (unit step)
% a = [1, -0.5];
% b = [1];

% Apply the filter
% y = filter(b, a, x);
% 
% % Plotting
% figure;
% stem(0:length(y)-1, y, 'DisplayName', 'Response'); % Plot the response
% hold on;
% stem(0:length(x)-1, x, 'r', 'DisplayName', 'Input Unit Step'); % Plot the input signal (in red)
% title('Difference Equation of IIR System');
% xlabel('n');
% ylabel('Amplitude');
% legend;
% grid on;
% hold off;

%% Correlation
% Cross correlation
x = [1, 2, 3, 4];
y = [1, -1, 2];

Rxy = xcorr(x, y)

Rxx = xcorr(x, x)

Ryy = xcorr(y, y)
% 







