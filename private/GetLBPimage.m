function [im_LBPmin, im_LBPmax, im_LBPdiffmin, im_LBPdiffmax] = GetLBPimage(im, LBP_weight)
    [im_row, im_col] = size(im);
	% step 1: 先取出被LBP mask遮罩的值後,再與遮罩中心比較(邊緣不處理)
	im_center = im(2:(im_row-1), 2:(im_col-1));
	im_center = repmat(im_center, 1, 1, 8);
	im_LBP_mask = zeros(im_row-2, im_col-2, 8);
	im_LBP_mask(:,:,1) = im(1:(im_row-2),	1:(im_col-2));
	im_LBP_mask(:,:,2) = im(2:(im_row-1),  1:(im_col-2));
	im_LBP_mask(:,:,3) = im(3:im_row,  	1:(im_col-2));
	im_LBP_mask(:,:,4) = im(3:im_row,		2:(im_col-1));
	im_LBP_mask(:,:,5) = im(3:im_row,		3:im_col);
	im_LBP_mask(:,:,6) = im(2:(im_row-1),	3:im_col);
	im_LBP_mask(:,:,7) = im(1:(im_row-2),	3:im_col);
	im_LBP_mask(:,:,8) = im(1:(im_row-2),	2:(im_col-1));
	im_LBP_mask = im_LBP_mask >= im_center;
	% step 2: 計算LBP碼
	    %讀取LBP的遮罩權重
	im_LBP = zeros(size(im_LBP_mask));
		%計算遮罩值
	im_LBP(:,:,1) = sum(im_LBP_mask .* LBP_weight{1}, 3);
	im_LBP(:,:,2) = sum(im_LBP_mask .* LBP_weight{2}, 3);
	im_LBP(:,:,3) = sum(im_LBP_mask .* LBP_weight{3}, 3);
	im_LBP(:,:,4) = sum(im_LBP_mask .* LBP_weight{4}, 3);
	im_LBP(:,:,5) = sum(im_LBP_mask .* LBP_weight{5}, 3);
	im_LBP(:,:,6) = sum(im_LBP_mask .* LBP_weight{6}, 3);
	im_LBP(:,:,7) = sum(im_LBP_mask .* LBP_weight{7}, 3);
	im_LBP(:,:,8) = sum(im_LBP_mask .* LBP_weight{8}, 3);
	% step 3: 計算LBPmin、LBPmax、LBPdiffmin、LBPdiffmax
	im_LBPmin = min(im_LBP, [], 3);
	im_LBPmax = max(im_LBP, [], 3);
	im_reg = sum(im_LBP, 3);
	im_LBPdiffmin = im_reg - 8*im_LBPmin;
	im_LBPdiffmax = 8*im_LBPmax - im_reg;
		%im_LBPdiffmin和im_LBPdiffmax正規化
	im_LBPdiffmin = round(normalize(im_LBPdiffmin, 'range' )*255);
	im_LBPdiffmax = round(normalize(im_LBPdiffmax, 'range' )*255);
end