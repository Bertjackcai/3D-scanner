function [mask1] =  make_mask_new(y_min,y_max,img_num,output_file_name)
%ʵ������mask�����귶Χ��0, 1280, 0, y_max�����ܹ�����mask����
%mask�����С��ͼ���С��ͬ��1280 * 1024��
%mask������ȷ����mask�����ڵ�ֵȫΪ1���������ֵȫΪ0��
mask = zeros(1024,1280);
for i = y_min:y_max
    for j = 1:1280
        mask(i,j)=1;
    end
end
mask1=uint8(mask);

img_set=load('img_rect.mat');
field_name = strcat('b',num2str(img_num));
img_mask = img_set.(strcat('a',num2str(img_num))) .* mask1;
img_mask=uint8(img_mask);
eval([field_name,'=',mat2str(img_mask,'class'),';']);
save(output_file_name,field_name,'-append');
% save(output_file_name,field_name);

end



