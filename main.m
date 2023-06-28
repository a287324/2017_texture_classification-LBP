%�M���u�@�ܼƤεe��
clearvars; clc;
warning off;
%Ū���Ѽ�
load('parameter\LBP_weight.mat'); 
load('parameter\cube_sphere.mat');
% �ѼƳ]�m
Rmin = 3;
Rmax = 10;

tic
% Ū���v��
% im = imread("test_data\Brodatz\1-1.gif");
im = imread("t.jpg");
% ��Ƕ�
if size(im, 3) == 3
    im = double(rgb2gray(im));
else
    im = double(im);
end

[im_row, im_col] = size(im);

% ��XLBP_feature
tic
[LBPfeature_origin, LBPfeature_fractal] = GetLBPfeature(im, Rmin, Rmax, LBP_weight, cube_sphere);
toc
% save('tt.mat', 'LBPfeature_origin');
% [im_LBPmin, im_LBPmax, im_LBPdiffmin, im_LBPdiffmax] = GetLBPimage(im, LBP_weight);
% imwrite(im2double(im_LBPmin),'test.gif');


disp('Finish');
