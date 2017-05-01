hold on;
grid on;
data = load('3.mat');
day = 5;
successful_rate = data.num( day * 1440 + 1:(day + 1) * 1440, 4)';
amount = data.num(day * 1440 + 1:(day + 1) * 1440, 3)';
response_time = data.num(day * 1440 + 1:(day + 1) * 1440, 5)';
time = 1:1:length(successful_rate);
plot(time / 60, successful_rate, 'r.')
% plot(time, amount / 1200, 'b.')
plot(time / 60, response_time / 100, 'g.')
hold off;
