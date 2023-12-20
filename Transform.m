% 获取图片与实际数据的关系
perx = (2401+2455+2510-2237-2291-2346)/(3*3);
y_delta = 680;
x_delta  = 2577;
scale = 10/ perx;

% 获取曲线数据
selected_boundary = B{5};
x = selected_boundary(:,2);
y = selected_boundary(:,1);

% 坐标转换
x_real = (x_delta - x) * scale;
y_real = (y_delta - y) * scale;

% 只研究一半
indices = x_real <= 0;
x_real = x_real(indices);
y_real = y_real(indices);