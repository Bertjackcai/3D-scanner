% mask to thresh
% threshold {num} ��ֵ��С
% input_img_num {num} �������ݵ�����
% input_file_name {string} ����mat�ļ���
% output_file_name {string} �����mat�ļ���

function []  = image_thresh( threshold, input_num, input_file_name, output_file_name )

mask_data = load(input_file_name);

for i = 1:input_num
    %     data = imread(strcat(input_file_name, num2str(i), '.bmp'));
    %     output_img = im2bw(data, threshold / 255);
    %     imwrite(output_img, strcat(output_file_name, num2str(i), '.bmp'));
    field_name = strcat('thresh', num2str(i));
    img_mask = mask_data.(strcat('b',num2str(i)));
    result = im2bw(img_mask, threshold / 255);
    
    eval([field_name,'=',mat2str(result, 'class'),';']);
    if i == 1
        save(output_file_name,field_name);
    else
        save(output_file_name,field_name,'-append');
    end
    
     imwrite(result, strcat(output_file_name, num2str(i), '.bmp'));
end
