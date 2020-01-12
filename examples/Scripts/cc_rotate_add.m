% ���������ת��������ϵ��

% input_num ��Ҫ�������������
% input_file_name ƽ�ƺ�������
% r ���ߵķ�������
% output_file_name �������ļ���(�ļ���ʽ: .mat)

function [] = cc_rotate_add(input_num, input_file_name, r, output_file_name)

cc_offset_data = load(input_file_name);
% ÿ����ת�ĽǶȣ������Ʊ�ʾ��
r=r * 2 * pi / 200;
% Rodrigues����������һ����ת����
% R = rotationVectorToMatrix(r);
R = rodrigues(r);

for i = 1:input_num
    if i == 100
        continue
    end
    
    if i == 101
        continue
    end
    
    data = cc_offset_data.(strcat('c_c_offset', num2str(i)));
    % ƽ��
    result = data * R^(i - 1);
    % �ֱ����ɲ�ͬ��field
    field_name = strcat('c_c_rotate', num2str(i));
    eval([field_name, '=', mat2str(result), ';']);
    % ����Ϊ.mat�ļ�
    if i == 1
        save(output_file_name,field_name);
    else
        save(output_file_name,field_name,'-append');
    end
    
end

end