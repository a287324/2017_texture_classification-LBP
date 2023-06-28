function ball = ball_gen2(r)
%   Generate a Ball of Radius r
  [xx yy zz] = meshgrid(-r:r, -r:r, -r:r);
  d = xx.^2 + yy.^2 + zz.^2;
  ball = d <= (r*r);
end