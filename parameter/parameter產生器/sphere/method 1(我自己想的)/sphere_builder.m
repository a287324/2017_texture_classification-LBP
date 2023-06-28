function im_sphere = sphere_builder(sphere_radius)
    cube_edge = sphere_radius*2+1;
    cube_center = sphere_radius+1;
    im_sphere = zeros(cube_edge, cube_edge,cube_edge);
    for x = 1:cube_edge
        for y = 1:cube_edge
            for z = 1:cube_edge
                if (x-cube_center)^2+(y-cube_center)^2+(z-cube_center)^2 <= sphere_radius^2
                    im_sphere(x,y,z) = 1;
                end
            end
        end
    end
end