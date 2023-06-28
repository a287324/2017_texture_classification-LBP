% 清除所有變數和畫面
clear all; clc;

for R = 3:10
	cube_sphere = sphere_builder(R);
	filename = ['sphere', mat2str(R),'.mat'];
	save(filename, 'cube_sphere');
end
disp('finish')
