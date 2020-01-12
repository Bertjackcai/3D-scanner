function [x0] = calc_true_camera_coordinates(image_num, u_v_file_path, output_file_name)

find_results = load(u_v_file_path);

[internal_matrix]  = get_internal_params('../public_data/Calib_Results.mat');
% �ڲ�
A = internal_matrix;

[X, Y, Z] = get_all_camera_coordinate(7, '../public_data/c_c_results.mat');

[fitresult, gof] = createFit(X, Y, Z);
%  coeffs = [p00, p10, p10]
coeffs = coeffvalues(fitresult);
p00 = coeffs(1);
p10 = coeffs(2);
p01 = coeffs(3);
% formula(fitresult) %   ��ȡ���ʽ
% p00 + p10*x + p01*y = z
% (x0, 0, 0)
x0 = -(p00 / p10);

for i = 1:image_num
    
    %     data = find_results.(strcat('find_', num2str(i)));
    data = find_results.(strcat('find', num2str(i)));
    [m, n] = size(data);
    
    field_name = strcat('c_c', num2str(i));
    %   init result
    result = zeros(m, 3);
    
    %    speed the calc
    vars = sym(zeros(1, m));
    for num = 1 : m
        variable_name = strcat('s', num2str(num));
        eval(['syms ', variable_name, ';']);
        eval([['vars(1,' num2str(num)  ')'], '=', variable_name, ';']);
    end

    %   ����ÿ���δ֪����s
    syms s;
    %   ��������ϵ����α�ʾ
    pixel_mat = [
        data(:, 1)';
        data(:, 2)';
        ones(1, m);
        ];
    %   A����������
    A_inv = inv(A);
    %   X����
    x = A_inv(1, :) * ([vars(1, :); vars(1, :); vars(1, :)] .* pixel_mat);
    %   Y ����
    y = A_inv(2, :) * ([vars(1, :); vars(1, :); vars(1, :)] .* pixel_mat);
    %   Z ����
    z = A_inv(3, :) * ([vars(1, :); vars(1, :); vars(1, :)] .* pixel_mat);
    %   ���巽��
    eqn =  p00 + p10 *  x + p01 * y - z == zeros(1, m);
    sol_s = solve(eqn);
    
    %  init s
    s = zeros(1, m);
    for k = 1 : m
        value = sol_s.(strcat('s', num2str(k)));
        s(1, k) = double(value);
    end
    
    tmp_result = A_inv *([s(1, :); s(1, :); s(1, :)] .* pixel_mat);
    
    result = tmp_result';

    eval([field_name, '=', mat2str(result), ';']);
    
    %     ����Ϊ.mat�ļ�
    if i == 1
        save(output_file_name,field_name);
    else
        save(output_file_name, field_name, '-append');
    end
    
end

end