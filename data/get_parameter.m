function [] = get_parameter(data, column, time, criterion, hour, cycle, shift_var, split_var)

B_total = [];

for i = time
    B = data(i).num(:, column);
    B_length = length(B);
    B_shifted = [B(shift_var + 1:B_length) ; B(1:shift_var)];
    actual_day = floor(length(B) / cycle);
    B_fixed = reshape(B_shifted(1:actual_day * cycle), cycle, actual_day)';
    %plot(1:length(B_fixed(1, :)), B_fixed(1, :));
    B_total = [B_total; B_fixed];
end

B_median_total = [];
B_std_total = [];
B_slope_total = [];
B_r_total = [];
B_std_fixed_total = [];
B_deleted_number = [];
all_number = length(split_var) - 1;
for serial = 1:all_number
    B_total_split = B_total(:, (1+(split_var(serial)-split_var(1))*hour) : ((split_var(serial+1)-split_var(1))*hour));
    % median
    B_median = median(B_total_split, 2);
    B_median_total = [B_median_total B_median];
    % std
    B_std = std(B_total_split, 1, 2);
    B_std_total = [B_std_total B_std];
    % slope
    B_slope = [];
    B_r = [];
    for i = 1:size(B_total_split)
        [slope, ~] = polyfit(1:size(B_total_split, 2), B_total_split(i, :), 1);
        B_slope = [B_slope; slope(1)];
        r = corrcoef(1:size(B_total_split, 2), B_total_split(i, :));
        B_r = [B_r; r(2, 1)];
        
        today = B_total_split(i, :);
        today_mean = mean(today);
        today_std = std(today, 1);
        largerThan3Sigma = find(today > today_mean + today_std * criterion);
        today(largerThan3Sigma) = [];
        smallerThan3Sigma = find(today > today_mean + today_std * criterion);
        today(smallerThan3Sigma) = [];
        B_deleted_number(i, serial) = length(largerThan3Sigma) + length(smallerThan3Sigma);
        B_std_fixed_total(i, serial) = std(today, 1);
    end
    B_slope_total = [B_slope_total B_slope];
    B_r_total = [B_r_total B_r];
    
end

useful_print(B_median_total, 'median');
useful_print(B_std_total, 'std');
useful_print(B_slope_total, 'slope');
useful_print(B_r_total, 'r');
useful_print(B_std_fixed_total, 'fixed_std');
useful_print(B_deleted_number, 'deleted_number');

end

function [] = useful_print(data, str)
    meanVal = mean(data);    
    stdVal = std(data, 1);
    disp(table(meanVal', stdVal', 'VariableNames', {['mean_of_' str], ['std_of_' str]}))
end

