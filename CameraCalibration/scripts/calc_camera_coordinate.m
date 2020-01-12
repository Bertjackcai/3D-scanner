% �����������ϵ�µ������

% input_num: �������ݵ�����
% calib_file_path: Calib_Results.mat�ļ���·��
% w_c_results_file_path: �������ϵ�µ������
% output_file_path: ����ļ�������

function []  = calc_camera_coordinate(input_num, calib_file_path, w_c_results_file_path, output_file_path)

external_matrix = get_external_params(input_num, calib_file_path);
world_coordinate_results = load(w_c_results_file_path);

for i = 1:input_num
    %     ��ξ���
    current_external_matrix = external_matrix(:, [1 2 4], i);
    
    current_data = world_coordinate_results.(strcat('w_c', num2str(i)));
    [m, n] = size(current_data);
    
    field_name = strcat('c_c', num2str(i));
    %   init result
    result = zeros(m, 3);
    
    for j = 1:m
        % ��������ϵ�µ� x �� y
        w_x = current_data(j, 1);
        w_y = current_data(j, 2);
        world_matrix = [w_x; w_y; 1];

        result(j, :) = current_external_matrix * world_matrix;
        
        eval([field_name, '=', mat2str(result), ';']);
        %     ����Ϊ.mat�ļ�
        if i == 1
            save(output_file_path, field_name);
        else
            save(output_file_path, field_name, '-append');
        end
        
    end
end

end
