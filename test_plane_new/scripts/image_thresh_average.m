% �Ҷȹ�һ��ȡƽ����uȡС�����õ�(u, v)��

% input_num �������ݵ�����
% input_filename �����mat�ļ���
% output_filename �����mat�ļ���

function []  = image_thresh_average( input_num, input_filename, output_filename )

thresh_data = load(input_filename);

for i = 1 :input_num
    data = thresh_data.(strcat('thresh',num2str(i)));
    
    % m_size ������ n_size ������
    [m_size, n_size] = size(data);
    result = [];
    
    index = 0;
    
    for m = 1 : m_size
        image_thresh_find = find(data(m, :));
        if isempty(image_thresh_find)==1
            continue;
        else
            index = index + 1;
            mean_index = mean(image_thresh_find);
            result(index, :) = [mean_index, m];
        end
    end
    
    field_name = strcat('find', num2str(i));
    eval([field_name,'=', mat2str(result, 'class'), ';']);
    
    if i == 1
        save(output_filename,field_name);
    else
        save(output_filename,field_name,'-append');
    end
    
    imwrite(result, strcat(output_filename, num2str(i), '.bmp'));
end
