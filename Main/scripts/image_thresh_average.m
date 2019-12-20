% % �Ҷȹ�һ��ȡƽ��
% % input_img_num {num} ����ͼƬ������
% % input_file_name {string} ����Ҫ�����ͼƬ��
% % output_file_name {string} �����ͼƬ�� image_thresh_average

% 
% function []  = image_thresh_average( input_num, input_file_name, output_file_name )
% 
% thresh_data = load(input_file_name);
% 
% for i = 1 :input_num
%     field_name = strcat('thresh_average', num2str(i));
%     
%     data = thresh_data.(strcat('thresh',num2str(i)));
%     
%     % m_size ������ n_size ������
%     [m_size, n_size] = size(data);
%     result = zeros(m_size, n_size);
%     for m = 1 : m_size
%         image_thresh_find = find(data(m, :));
%         if isempty(image_thresh_find)==1
%             continue;
%         else
%             mean_index = round(mean(image_thresh_find));
%             result(m, mean_index) = 1;
% %             result(m, mean_index) = result(m, mean_index) / 255;
%         end
%     end
%     
%     eval([field_name,'=', mat2str(result, 'class'), ';']);
%     
%     if i == 1
%         save(output_file_name,field_name);
%     else
%         save(output_file_name,field_name,'-append');
%     end
%     
%     imwrite(result, strcat(output_file_name, num2str(i), '.bmp'));
% end


% �Ҷȹ�һ��ȡƽ��
% input_img_num {num} ����ͼƬ������
% input_file_name {string} ����Ҫ�����ͼƬ��
% output_file_name {string} �����ͼƬ�� image_thresh_average*

function []  = image_thresh_average( input_num, input_file_name, output_file_name )

thresh_data = load(input_file_name);

for i = 1 :input_num
    field_name = strcat('thresh_average', num2str(i));
    
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
    
    eval([field_name,'=', mat2str(result, 'class'), ';']);
    
    if i == 1
        save(output_file_name,field_name);
    else
        save(output_file_name,field_name,'-append');
    end
    
    imwrite(result, strcat(output_file_name, num2str(i), '.bmp'));
end
