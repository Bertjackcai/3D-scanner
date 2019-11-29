% cc = load('Calib_Results.mat', ff);

function [result]  = calc_world_params()

length = 7;
result = zeros(3, 4, 7);

external_matrix = get_external_params();
internal_matrix = get_internal_params();

for i = 1:length
%     omc = mat.(strcat('omc_', num2str(i)));
%     t = mat.(strcat('Tc_', num2str(i)));
%     rotVecToMat = rotationVectorToMatrix(omc);
%     out = [rotVecToMat, t];
%     result(:, :, i) = out;
    c_matrix = internal_matrix * external_matrix(:, :, i);
    c_matrix_inv = inv(c_matrix);
    data = importdata(strcat('image_find', num2str(i)), '.txt');
    u_v_data = data.data;
    [m] = size(u_v_data);
    for j = 1:m
        u = u_v_data(j, 1);
        v = u_v_data(j, 2);
        pixel_matrix = [u; v; 1];
        s = c_matrix_inv(4, :) * pixel_matrix;
        x = (c_matrix_inv(1, :) * pixel_matrix) ./ s;
        y = (c_matrix_inv(1, :) * pixel_matrix) ./ s;
        
       
    end
end
end