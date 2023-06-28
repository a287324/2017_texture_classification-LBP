%清除工作變數及畫面
clearvars; clc;
warning off;
%讀取參數
load('parameter\LBP_weight.mat'); 
load('parameter\cube_sphere.mat');
% 參數設置
Rmin = 3;
Rmax = 10;

tic
% 讀取影像
% im = imread("test_data\Brodatz\1-1.gif");
im = imread("t.jpg");
% 轉灰階
if size(im, 3) == 3
    im = double(rgb2gray(im));
else
    im = double(im);
end

[im_row, im_col] = size(im);

% 找出LBP_feature
tic
[LBPfeature_origin, LBPfeature_fractal] = GetLBPfeature(im, Rmin, Rmax, LBP_weight, cube_sphere);
toc
% save('tt.mat', 'LBPfeature_origin');
% [im_LBPmin, im_LBPmax, im_LBPdiffmin, im_LBPdiffmax] = GetLBPimage(im, LBP_weight);
% imwrite(im2double(im_LBPmin),'test.gif');


disp('Finish');
