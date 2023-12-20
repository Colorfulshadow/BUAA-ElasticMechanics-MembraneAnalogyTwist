% 读取origin.png文件
img = imread('image.png');
%imshow(img);

% 转换为灰度图
if size(img, 3) == 3
    img_gray = rgb2gray(img);
else
    img_gray = img;
end
%imshow(img_gray);

% 调整对比度和亮度
img_enhanced = imadjust(img_gray);
%imshow(img_enhanced);

% 应用滤波器,去除噪声或进一步增强曲线
img_filtered = imgaussfilt(img_enhanced, 2);
%imshow(img_filtered);

% 裁剪图片
img_cropped = imcrop(img_filtered);
imwrite(img_cropped, 'cropped_image.png');
imshow(img_cropped)