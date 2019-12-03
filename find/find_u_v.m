% find the param u and v
% input_img_num ����ͼƬ����
% input_file_name ����ͼƬ���ļ���
% output_file_name ����ļ���  ������.mat

function []  = find_u_v( input_img_num, input_file_name, output_file_name )

for i = 1:input_img_num
    data = imread(strcat('../thresh/', input_file_name, num2str(i), '.bmp'));
    
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
%   �ֱ����ɲ�ͬ��field
    field_name = strcat('find_', num2str(i));
    data = [col, row];
    eval([field_name, '=', mat2str(data), ';']);
%     ����Ϊ.mat�ļ�
    save(output_file_name, field_name, '-append');
    
end
