% ���ͬһ�߶ȵ�Բ��

function [X, Y, Z] = circle_center_fitting(group_nums, c_c_same_height_results_path, output_file_path)

% init X Y Z
X = [];
Y = [];
Z = [];

for i = 1:group_nums
    c_c_same_height_results = load(c_c_same_height_results_path);
    data = c_c_same_height_results.(strcat('c_c_same_height', num2str(i)));
    x = data(:, 1);
    y = data(:, 2);
    z = data(:, 3);
    % ������Ϊ��ʼԲ��
    p0=mean(data);
    % �Ե����ĵ�ƽ������Ϊ��ʼ�뾶
    r=mean(sqrt(sum((data - repmat(p0, [size(data, 1) 1])).^2, 2)));
    
    f=@(p)(x - p(1)).^2+(y - p(2)).^2+(z - p(3)).^2-p(4).^2;
    
    p=lsqnonlin(f, [p0 r]);
    
    X = [X, p(1)];
    Y = [Y, p(2)];
    Z = [Z, p(3)];
end

fitting_circle_center = [X', Y', Z'];
save(output_file_path, 'fitting_circle_center');

end

% x=X(:,1);y=X(:,2);z=X(:,3);
% p0=mean(X);%������Ϊ��ʼԲ��
% r02=mean(sqrt(sum((X-repmat(p0,[size(X,1) 1])).^2,2)));%�Ե����ĵ�ƽ������Ϊ��ʼ�뾶
% f=@(p)(X(:,1)-p(1)).^2+(X(:,2)-p(2)).^2+(X(:,3)-p(3)).^2-p(4).^2;
% p=lsqnonlin(f,[p0 r02]);
% x0=p(1);y0=p(2);z0=p(3);