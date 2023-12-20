img_cropped = imread('cropped_image.png');
% 边缘检测(Canny 算法)
edges = edge(img_cropped, 'canny');
%imshow(edges);

% 提取曲线轮廓
[B,L] = bwboundaries(edges, 'noholes');

% 选择合适的轮廓
imshow(label2rgb(L, @jet, [.5 .5 .5]))
hold on
for k = 1:length(B)
   boundary = B{k};
   plot(boundary(:,2), boundary(:,1), 'w', 'LineWidth', 3)
   midPoint = round(mean(boundary, 1));
   text(midPoint(2), midPoint(1), sprintf('%d', k), 'Color', 'yellow', 'FontSize', 5)
end