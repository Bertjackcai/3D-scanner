% ��ֵ������

% threshold ��ֵ��С
% input_num �������ݵ�����
% input_file_path ����mat�ļ�·��
% output_file_path �����mat�ļ�·��

function []  = image_thresh(threshold, input_num, input_file_path, output_file_path)

mask_data = load(input_file_path);

for i = 1:input_num
    img_mask = mask_data.(strcat('b', num2str(i)));
    result = im2bw(img_mask, threshold / 255);
    
    field_name = strcat('thresh', num2str(i));
    
    eval([field_name,'=',mat2str(result, 'class'),';']);
    if i == 1
        save(output_file_path,field_name);
    else
        save(output_file_path,field_name,'-append');
    end
    
    imwrite(result, strcat(output_file_path, num2str(i), '.bmp'));
end
