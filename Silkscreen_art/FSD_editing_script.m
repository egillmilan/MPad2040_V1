clc; clear all; close all;

% for i = 1:20
%     img = imread('saturn/saturn' + string(i) + '.jpg');
%     imgFSD = FloydSteinbergDots(img, 4, 30, 1e-10);
%     imwrite(imgFSD,'saturn' + string(i) + '_e.bmp', 'bmp');
% end

img = imread('saturn/saturn16.jpg');
imgFSD = FloydSteinbergDots(img-5, 20);
figure; imshow(imgFSD);
imwrite(imgFSD,'saturn16_e_small.bmp', 'bmp');