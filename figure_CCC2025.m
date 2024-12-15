xline([6.5273,9.2464,10.3183],'--b', {'l_{p1}','l_{p2}','l_{p3}'});
h = xline([9.2466,10.8681,11.7936],'--r', {'l_{p1}','l_{p2}','l_{p3}'});
% 设置标签的水平和垂直对齐方式
for i = 1:length(h)
    set(h(i), 'LabelHorizontalAlignment', 'center', 'LabelVerticalAlignment', 'middle');
end
legend('r_{longIF}','PEAK','d_{long}','\lambda')

for kk=1:3
mean(errors_final{kk})
std(errors_final{kk})
end

for kk=1:3
cdfplot(errors_final{kk})
hold on
xlabel('errors(m)')
ylabel('CDF')
title('')
legend('Point1','Point2','Point3')
end

thre_1=load('threshold_errors_0_001.mat');
thre_2=load('threshold_errors_001_002.mat');
thre_3=load('threshold_errors_0021_003.mat');
load('errors_final.mat');
two_threshold=0.001:0.001:0.04;
threshold_errors=[thre_1.threshold_errors;thre_2.threshold_errors;thre_3.threshold_errors];
figure
plot(two_threshold,threshold_errors(:,1),'-o')
hold on
plot(two_threshold,threshold_errors(:,2),'-o')
plot(two_threshold,threshold_errors(:,3),'-o')
ylabel('RMSE(m)')
xlabel('Threshold')
legend('Point1','Point2','Point3')

load
for i =1:3
[avg, stddev, max_val, min_val, percentile_95, percentile_50]=statistics(errors_final{i});
% 假设 errors_final{1} 是一个包含误差数据的数组

% 输出结果
disp(['Average: ', num2str(avg)]);
disp(['Standard Deviation: ', num2str(stddev)]);
disp(['Max Value: ', num2str(max_val)]);
disp(['Min Value: ', num2str(min_val)]);
disp(['95th Percentile: ', num2str(percentile_95)]);
disp(['50th Percentile: ', num2str(percentile_50)]);

end

% 数据点
points = {'point1', 'point2', 'point3'}; % 横坐标标签
values = [0.1495, 0.1005, 0.2558];      % 对应的值
errors = [0.08, 0.04, 0.04];            % 对应的误差

% 创建图形
figure;

% 绘制误差条形图
bar(values); % 绘制柱状图代替箱型图，适合少量数据
hold on;

% 添加误差线
errorbar(1:3, values, errors, 'k', 'linestyle', 'none', 'LineWidth', 1.5); 

% 设置横坐标
set(gca, 'XTickLabel', points);

% 纵坐标标签
ylabel('RMSE (m)');

% 设置图形标题和样式
title('RMSE with Error Bars for Point1, Point2, and Point3');
grid on;

% 显示图形
hold off;