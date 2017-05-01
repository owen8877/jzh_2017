data = [load('1.mat') load('2.mat') load('3.mat') load('4.mat')];

hour = 60;
cycle = 1440;
criterion = 2;
time = 2:4;

disp('data for B(usiness amount)')
B_shift_var = 6 * 60;
B_split_var = [6 9 18 23 30];
get_parameter(data, 3, time, criterion, hour, cycle, B_shift_var, B_split_var);

disp('data for S(uccessful rate)')
S_shift_var = 9 * 60;
S_split_var = [9 23 33];
get_parameter(data, 4, time, criterion, hour, cycle, S_shift_var, S_split_var);

disp('data for R(esponding time)')
R_shift_var = 9 * 60;
R_split_var = [9 23 33];
get_parameter(data, 5, time, criterion, hour, cycle, R_shift_var, R_split_var);
