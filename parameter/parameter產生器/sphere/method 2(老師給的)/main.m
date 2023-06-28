% 清除所有變數和畫面
clear all; clc;
cube_sphere = cell(10,1);
for R = 3:10
	cube_sphere{R} = ball_gen2(R);
end
filename = ['cube_sphere.mat'];
save(filename, 'cube_sphere');
disp('finish')
