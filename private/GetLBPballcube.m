function [cube_V_im] = GetLBPballcube(im, R, cube_sphere)
    [im_row, im_col] = size(im);
    % step 1: 建立內部全0的立方體
        % 建立立方體
    cube_x = im_row+2*R;	cube_y = im_col+2*R;	cube_z = 256+2*R;
    cube_V_im = zeros(cube_x, cube_y, cube_z);
        % 建立球心表格
    LUT = zeros(im_row*im_col, 3);
    [LUT(:,1), LUT(:,2)] = (ind2sub([im_row, im_col], [1:im_row*im_col].'));
    LUT(:,1:2) = LUT(:,1:2) + R;
    LUT(:,3) = reshape(im, [], 1) + 1 + R;
    % step 5.2: 依據影像的灰階值在立方體的位置建立一個球體(球體內部都是1)
    for n = 1:size(LUT,1)
        sphere_x = [LUT(n,1)-R:LUT(n,1)+R];
        sphere_y = [LUT(n,2)-R:LUT(n,2)+R];
        sphere_z = [LUT(n,3)-R:LUT(n,3)+R];
        cube_V_im(sphere_x, sphere_y, sphere_z) = cube_V_im(sphere_x, sphere_y, sphere_z) + cube_sphere{R};
    end
end