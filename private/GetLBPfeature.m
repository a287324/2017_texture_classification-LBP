function [LBPfeature_origin, LBPfeature_fractal] = GetLBPfeature(im, Rmin, Rmax, LBP_weight, cube_sphere)
    % 計算不同的LBP特徵圖
    [im_LBPmin, im_LBPmax, im_LBPdiffmin, im_LBPdiffmax] = GetLBPimage(im, LBP_weight);
    % 計算特徵向量
    Volumn_influence_origin = zeros(1, Rmax-Rmin+1);
	Volumn_influence_LBPmin = Volumn_influence_origin;
	Volumn_influence_LBPmax = Volumn_influence_origin;
	Volumn_influence_LBPdiffmin = Volumn_influence_origin;
	Volumn_influence_LBPdiffmax = Volumn_influence_origin;
    for R = Rmin:Rmax
        % 取得長完球的立方體
        cube_V_origin = GetLBPballcube(im(2:end-1, 2:end-1), R, cube_sphere);
        cube_V_LBPmin = GetLBPballcube(im_LBPmin, R, cube_sphere);
        cube_V_LBPmax = GetLBPballcube(im_LBPmax, R, cube_sphere);
        cube_V_LBPdiffmin = GetLBPballcube(im_LBPdiffmin, R, cube_sphere);
        cube_V_LBPdiffmax = GetLBPballcube(im_LBPdiffmax, R, cube_sphere);
        % 計算influence volumn
		Volumn_influence_origin(R-Rmin+1) = sum(sum(sum(cube_V_origin > 0)));
		Volumn_influence_LBPmin(R-Rmin+1) = sum(sum(sum(cube_V_LBPmin > 0)));
		Volumn_influence_LBPmax(R-Rmin+1) = sum(sum(sum(cube_V_LBPmax > 0)));
		Volumn_influence_LBPdiffmin(R-Rmin+1) = sum(sum(sum(cube_V_LBPdiffmin > 0)));
		Volumn_influence_LBPdiffmax(R-Rmin+1) = sum(sum(sum(cube_V_LBPdiffmax > 0)));
    end
    % 計算fractal dimension(feature vector)
    Rrng = Rmin:Rmax;
	Vector_feature_origin = 3 - log(Volumn_influence_origin) ./ log(Rrng);
	Vector_feature_LBPmin = 3 - log(Volumn_influence_LBPmin) ./ log(Rrng);
	Vector_feature_LBPmax = 3 - log(Volumn_influence_LBPmax) ./ log(Rrng);
	Vector_feature_LBPdiffmin = 3 - log(Volumn_influence_LBPdiffmin) ./ log(Rrng);
	Vector_feature_LBPdiffmax = 3 - log(Volumn_influence_LBPdiffmax) ./ log(Rrng);
    % 整合feature vector
    LBPfeature_origin = [Volumn_influence_origin, Volumn_influence_LBPmin, Volumn_influence_LBPmax, Volumn_influence_LBPdiffmin, Volumn_influence_LBPdiffmax];
	LBPfeature_fractal = [Vector_feature_origin, Vector_feature_LBPmin, Vector_feature_LBPmax, Vector_feature_LBPdiffmin, Vector_feature_LBPdiffmax];
end