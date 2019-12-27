% ��άƽ������Բ�ĺͰ뾶

function [k, resnorm] = fitting_circle_center_2d(x, y)

xdata = x;
ydata = y;

k0 = ones(1,3);
F = @(k)(xdata - k(1)).^2+(ydata - k(2)).^2-k(3)^2;
% (k(0), k(1)) Ϊ��ϵ�Բ��
% k(3) Ϊ�뾶
[k,resnorm] = lsqnonlin(F,k0);

end