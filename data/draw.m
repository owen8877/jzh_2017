data = [load('1.mat') load('2.mat') load('3.mat') load('4.mat')];

%% Pic for the general tendency of BSR from Jan 23 to Feb 7
days = 15;

B_total = [data(1).num(:, 3); data(2).num(:, 3)];
S_total = [data(1).num(:, 4); data(2).num(:, 4)];
R_total = [data(1).num(:, 5); data(2).num(:, 5)];

time_axis = 1/1440 : 1/1440 : days;

startDate = datenum('2017-01-23');
endDate = datenum('2017-02-07');
xData = linspace(startDate, endDate, 15*1440);

subplot(3, 1, 1);
plot(xData, B_total(1:days*1440));
datetick('x', 'mm-DD', 'keeplimits')
ylabel('Business Amount')
title('Characters of ATM transaction data')

subplot(3, 1, 2);
plot(xData, S_total(1:days*1440) * 100, 'r');
datetick('x', 'mm-DD', 'keeplimits')
ylabel('Successful Rate(%)')

subplot(3, 1, 3);
plot(xData, R_total(1:days*1440), 'g');
datetick('x', 'mm-DD', 'keeplimits')
ylabel('Respoding Time(ms)')
xlabel('Day')

%% Pic for Feb 1
feb1.b = data(2).num(1:1440, 3);
feb1.s = data(2).num(1:1440, 4);
feb1.r = data(2).num(1:1440, 5);

sdate = 1/60:1/60:1440/60;

figure
sub1 = subplot(3, 1, 1);
hold(sub1, 'on');
plot(sdate, feb1.b, 'b.');
plot(6*ones(1,2), ylim, 'b:');
plot(9*ones(1,2), ylim, 'b:');
plot(18*ones(1,2), ylim, 'b:');
plot(23*ones(1,2), ylim, 'b:');
ylabel('Business Amount')
title('Patterns of ATM transaction data characters (Feb 1)')

sub2 = subplot(3, 1, 2);
hold(sub2, 'on');
plot(sdate, feb1.s, 'r.');
plot(9*ones(1,2), ylim, 'r:');
plot(23*ones(1,2), ylim, 'r:');
ylabel('Successful Rate(%)')

sub3 = subplot(3, 1, 3);
hold(sub3, 'on');
plot(sdate, feb1.r, 'g.');
plot(9*ones(1,2), ylim, 'g:');
plot(23*ones(1,2), ylim, 'g:');
ylabel('Respoding Time(ms)')
xlabel('Hour')
