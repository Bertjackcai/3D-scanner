% ��ȡ���е��������ϵ�µĵ�

% input_num: �����ͼƬ����
% result_file_path: �����������ϵ�µ������ x' y' z'��mat�ļ�

function [X, Y, Z]  = get_all_camera_coordinate(input_num, results_file_path)
X = [];
Y = [];
Z = [];

camera_coordinate_results = load(results_file_path);

for i = 1:input_num
    if i == 100
        continue
    end
    
    if i == 101
        continue
    end
    
    data = camera_coordinate_results.(strcat('c_c', num2str(i)));
    x = data(:, 1);
    y = data(:, 2);
    z = data(:, 3);
    X = [X, x'];
    Y = [Y, y'];
    Z = [Z, z'];
    
end
end