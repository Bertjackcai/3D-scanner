% ������������ϵ�µ������

% image_num: ͼƬ����
% calib_file_path: Calib_Results.mat�ļ���·��
% u_v_results_file_path: u,v�������
% output_filename: ����ļ�������

function []  = calc_world_coordinate(input_num, calib_file_path, u_v_results_file_path, output_filename)

external_matrix = get_external_params(input_num, calib_file_path);
internal_matrix = get_internal_params(calib_file_path);
find_result = load(u_v_results_file_path);

for i = 1:input_num
    % B matrix
    c_matrix = internal_matrix * external_matrix(:, [1 2 4], i);
    c_matrix_inv = inv(c_matrix);
    
    current_data = find_result.(strcat('find_', num2str(i)));
    [m, n] = size(current_data);
    
    field_name = strcat('w_c', num2str(i));
    %   init result
    result = zeros(m, 3);
    
    for j = 1:m
        u = current_data(j, 1);
        v = current_data(j, 2);
        pixel_matrix = [u; v; 1];
        %   1/s�������ĵ���
        s = c_matrix_inv(3, :) * pixel_matrix;
        %   ��������ϵ�µ�x
        x = (c_matrix_inv(1, :) * pixel_matrix) ./ s;
        %   ��������ϵ�µ�y
        y = (c_matrix_inv(2, :) * pixel_matrix) ./ s;
        
        result(j, :) = [x, y, 0];
        
        eval([field_name, '=', mat2str(result), ';']);
        %     ����Ϊ.mat�ļ�
        if i == 1
            save(output_filename, field_name);
        else
            save(output_filename, field_name, '-append');
        end
        
    end
    
end

end
