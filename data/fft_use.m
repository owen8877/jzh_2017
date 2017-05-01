data = load('3.mat');
amount = data.num(:, 5)';
Fs = 1440;
T = 1 /Fs;
L = length(amount);
t = (0:L-1) * T;

Y = fft(amount);
P2 = abs(Y);
P1 = P2(1:L/200+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/200))/L;
plot(f,P1)
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')

for index = 1:length(amount)
    if abs(Y(index)) < 0.3e6
        Y(index) = 0;
    end
en
figure;
exp_amount = abs(ifft(Y));
day = 27;
plot(t(day * 1440 + 1:(day + 1) * 1440),exp_amount(day * 1440 + 1:(day + 1) * 1440))
title('ifft')

figure;
day = 27;
plot(t(day * 1440 + 1:(day + 1) * 1440),amount(day * 1440 + 1:(day + 1) * 1440) - exp_amount(day * 1440 + 1:(day + 1) * 1440))
title('delta')
figure;
day = 27;
plot(t(day * 1440 + 1:(day + 1) * 1440),amount(day * 1440 + 1:(day + 1) * 1440))
title('origin')