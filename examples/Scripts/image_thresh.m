% ��ֵ������

% threshold ��ֵ��С
% input_num ��Ҫ�����ͼƬ����
% input_file_name �����ͼƬ���ļ���
% output_file_name �����ͼƬ�ļ���

function []  = image_thresh(threshold, input_num, input_file_name, output_file_name)

for i = 1:input_num
    data = imread(strcat(input_file_name, num2str(i), '.bmp'));
    result = im2bw(data, threshold / 255);
    
    imwrite(result, strcat(output_file_name, num2str(i), '.bmp'));
end
