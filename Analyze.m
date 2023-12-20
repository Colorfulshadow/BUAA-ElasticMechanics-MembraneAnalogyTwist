% 在指定区间内评估导数
x_values = linspace(min(x_real), max(x_real), 1000); % 使用足够多的点以便找到准确的最大最小值
slopes = arrayfun(@(x) model_derivative(fittedmodel, x), x_values);

% 寻找最大和最小斜率的点
[max_slope, idx_max] = max(slopes);
[min_slope, idx_min] = min(slopes);
x_max_slope = x_values(idx_max);
x_min_slope = x_values(idx_min);

% 划分斜率区间并找到对应点
slope_intervals = linspace(min_slope, max_slope, 11);
x_points_for_intervals = arrayfun(@(s) find_closest_slope_x(s, slopes, x_values), slope_intervals);

% 显示结果
fprintf('最大斜率点：x = %f\n', x_max_slope);
fprintf('最小斜率点：x = %f\n', x_min_slope);
fprintf('对应于斜率区间的 x 值：\n');
disp(x_points_for_intervals);

% 定义一个函数来计算导数
function dy = model_derivative(fittedmodel, x)
    h = 1e-5;  % 微小的步长用于数值导数
    dy = (feval(fittedmodel, x + h) - feval(fittedmodel, x - h)) / (2 * h);
end

% 定义一个函数来找到最接近给定斜率的 x 值
function x_closest = find_closest_slope_x(target_slope, slopes, x_values)
    [~, idx] = min(abs(slopes - target_slope));
    x_closest = x_values(idx);
end