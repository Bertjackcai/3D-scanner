function [mask1] =  rect2mask_bmp(img_num,img_name,y_max)
% �ϳ�read_images.m��make_mask_new.m
% ��ȡimage_rectͼƬ����mask��˺󱣴���img_mask.mat
mask = zeros(1024,1280);
for i = 1:y_max
    for j = 1:1280
        mask(i,j)=1;
    end
end
mask1=uint8(mask);

for i = 1:img_num
    img = imread(strcat(img_name,num2str(i),'.bmp'));
    img=uint8(img);
    img_mask = img .* mask1;
    img_mask=uint8(img_mask);
    imwrite(img_mask,strcat('../images/image_mask',num2str(i),'.bmp'));
end
end