% t ƽ�ƾ���
% input_file_name �������ϵ�µĵ�mat�ļ�
% input_num ��Ҫ�����ͼƬ����
% output_file_name �������ļ���(�ļ���ʽ: .mat)

function [] = cc_offset(t, input_file_name, input_num, output_file_name)

cc_data = load(input_file_name);

for i = 1:input_num
    data = cc_data.(strcat('c_c', num2str(i)));
    
    % ƽ��
    result = data - t;
    %   �ֱ����ɲ�ͬ��field
    field_name = strcat('c_c_offset', num2str(i));
    
    eval([field_name, '=', mat2str(result), ';']);
    %     ����Ϊ.mat�ļ�
    if i == 1
        save(output_file_name,field_name);
    else
        save(output_file_name,field_name,'-append');
    end
end

end