function [mask1] =  make_mask(x_min,x_max,y_min,y_max)
%ʵ������mask�����귶Χ��x_min, x_max, y_min, y_max�����ܹ�����mask����
%mask�����С��ͼ���С��ͬ��1280 * 1024��
%mask������ȷ����mask�����ڵ�ֵȫΪ1���������ֵȫΪ0��
mask = zeros(1024,1280);
for i = y_min:y_max
    for j = x_min:x_max
        mask(i,j)=1;
    end
end
mask1=uint8(mask);
end


