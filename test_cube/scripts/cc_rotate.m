
function [] = cc_rotate(input_num, input_file_name, r, output_file_name)

cc_offset_data = load(input_file_name);

for i = 1:input_num
    data = cc_offset_data.(strcat('c_c_offset', num2str(i)));
    
    R = rotationVectorToMatrix(r);
    R = R * pi  / 10;
    % ƽ��
    result = data * R^(i - 1);
    
    %   �ֱ����ɲ�ͬ��field
    field_name = strcat('c_c_rotate', num2str(i));
    
    eval([field_name, '=', mat2str(result), ';']);
    %     ����Ϊ.mat�ļ�
    if i == 1
        save(output_file_name,field_name);
    else
        save(output_file_name,field_name,'-append');
    end
    
end

end