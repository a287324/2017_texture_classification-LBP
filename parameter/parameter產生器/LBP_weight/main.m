clearvars; clc;
LBP_weight = cell(8,1);
LBP_weight{1} = reshape([1,128,64,32,16,8,4,2],1,1,8); %LBP½XªºÅv­«­È
LBP_weight{2} = reshape([2,1,128,64,32,16,8,4],1,1,8);
LBP_weight{3} = reshape([4,2,1,128,64,32,16,8],1,1,8);
LBP_weight{4} = reshape([8,4,2,1,128,64,32,16],1,1,8);
LBP_weight{5} = reshape([16,8,4,2,1,128,64,32],1,1,8);
LBP_weight{6} = reshape([32,16,8,4,2,1,128,64],1,1,8);
LBP_weight{7} = reshape([64,32,16,8,4,2,1,128],1,1,8);
LBP_weight{8} = reshape([128,64,32,16,8,4,2,1],1,1,8);

save('LBP_weight.mat', 'LBP_weight');