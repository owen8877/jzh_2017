hold on;
data = load('3.mat');
day = 13;
successful_rate = data.num(day * 1440 + 1:(day + 1) * 1440, 4)';
amount = data.num(day * 1440 + 1:(day + 1) * 1440, 3)';
response_time = data.num(day * 1440 + 1:(day + 1) * 1440, 5)';
time = 1:1:1440;
plot(time, successful_rate, 'r.')
plot(time, amount / 1200, 'b.')
plot(time, response_time / 100, 'g.')

amp = [593 75.32 140.5 62.3 38.7 20.5];
hold off;
Fs = 1440;            % Sampling frequency
T = 1/Fs;             % Sampling period
L = 1440;             % Length of signal
t = (0:L-1)*T;        % Time vector

S = 0;
for index = 1:6
    S = S + amp(index) * sin(index * pi * 2 * t);
end
plot(Fs * t, S) 