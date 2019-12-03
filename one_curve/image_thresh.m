% mask to thresh
% threshold {num} ��ֵ��С
% input_img_num {num} ����ͼƬ������
% input_file_name {string} ����Ҫ�����ͼƬ��
% output_file_name {string} �����ͼƬ�� 

function [s]  = image_thresh( threshold, input_img_num, input_file_name, output_file_name )

for i = 1:input_img_num
    data = imread(strcat(input_file_name, num2str(i), '.bmp'));
    output_img = im2bw(data, threshold / 255);
    imwrite(output_img, strcat(output_file_name, num2str(i), '.bmp'));
end
