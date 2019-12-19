% find the param u and v
% input_img_num ����ͼƬ����
% input_file_name ����ͼƬ���ļ���
% output_file_name ����ļ���  ������.mat

function []  = find_u_v( input_num, input_file_name, output_file_name )

thresh_data = load(input_file_name);

for i = 1:input_num
    %     data = imread(strcat(input_file_name, num2str(i), '.bmp'));
    data = thresh_data.(strcat('thresh_average', num2str(i)));
    
    %     find() �����������߾����в�Ϊ0��Ԫ�ص�λ������
    [row, col] = find(data);
    
    row_length = length(row(:));
    col_length = length(col(:));
    
    % catch error
    if row_length ~= col_length
        fprintf('Error: the length of the row is not equal to the length of the col');
        fprintf('\n');
        continue
    end
    result = [col, row];
    %   �ֱ����ɲ�ͬ��field
    field_name = strcat('find_', num2str(i));
    
    eval([field_name, '=', mat2str(result), ';']);
    %     ����Ϊ.mat�ļ�
    if i == 1
        save(output_file_name,field_name);
    else
        save(output_file_name,field_name,'-append');
    end
    
end
