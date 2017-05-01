a = -10:0.05:10;

pf = normcdf(a, sigma);

ph110 = normcdf(a+1, 1);
ph115 = normcdf(a+1, 1.5);
ph120 = normcdf(a+1, 2);

ph210 = normcdf(a+2, 1);
ph215 = normcdf(a+2, 1.5);
ph220 = normcdf(a+2, 2);

ph310 = normcdf(a+3, 1);
ph315 = normcdf(a+3, 1.5);
ph320 = normcdf(a+3, 2);

sub1 = subplot(1, 3, 1);
hold(sub1, 'on');
plot(pf, ph110);
plot(pf, ph115);
plot(pf, ph120);
title('~M = -1')

sub2 = subplot(1, 3, 2);
hold(sub2, 'on');
plot(pf, ph210);
plot(pf, ph215);
plot(pf, ph220);
title('~M = -2')

sub3 = subplot(1, 3, 3);
hold(sub3, 'on');
plot(pf, ph310);
plot(pf, ph315);
plot(pf, ph320);
title('~M = -3')
legend('~σ/σ = 1.0', '~σ/σ = 1.5', '~σ/σ = 2.0')
