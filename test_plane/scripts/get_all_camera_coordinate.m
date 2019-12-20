% result_file_path: �����������ϵ�µ� x' y' z'���ļ�

function [X, Y, Z]  = get_all_camera_coordinate(length, results_file_path)
X = [];
Y = [];
Z = [];

camera_coordinate_results = load(results_file_path);

% color = ['r', 'b', 'k', 'g.', 'rx', 'bx', 'kx', 'gx', 'ro', 'bo', 'ko', 'go'];
% index = 0;

for i = 1:length
    data = camera_coordinate_results.(strcat('c_c', num2str(i)));
    x = data(:, 1);
    y = data(:, 2);
    z = data(:, 3);
    
%     index = index + 1;
%     plot(x, y, color(index));
%     hold on;
    X = [X, x'];
    Y = [Y, y'];
    Z = [Z, z'];
    
end
end