function [a] =  read_images(img_num,img_name)
% ��ȡimage_rect�������һ��mat�ļ�

for i = 1:img_num
    field_name = strcat('a',num2str(i));
    img = imread(strcat(img_name,num2str(i),'.bmp'));
%     img=uint8(img);
    eval([field_name,'=',mat2str(img,'class'),';']);
end

end