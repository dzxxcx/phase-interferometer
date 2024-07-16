% 测角误差-信号频率误差
eps=0.00000001;
f = 5.8e9;  % 5.8GHz
c = 3e8;    % 光速
lambda = c/f;
d_lambda = 1/2;
dphi = 0*pi/180;
dlambda1 = 1e-3;
dlambda3 = 2e-3;
dlambda5 = 3e-3;
theta = -80:1:80;
dtheta1 = dphi./(2*pi*d_lambda*cosd(theta))+dlambda1/lambda*tand(theta);
dtheta1 = dtheta1/pi*180;
dtheta3 = dphi./(2*pi*d_lambda*cosd(theta))+dlambda3/lambda*tand(theta);
dtheta3 = dtheta3/pi*180;
dtheta5 = dphi./(2*pi*d_lambda*cosd(theta))+dlambda5/lambda*tand(theta);
dtheta5 = dtheta5/pi*180;
plot(theta,dtheta1,theta,dtheta3,theta,dtheta5);
title('测角误差-信号频率误差');xlabel('入射角度\theta(\circ)');ylabel('测角误差\Delta\theta(\circ)');
legend('\Delta\lambda=1mm','\Delta\lambda=2mm','\Delta\lambda=3mm','Location','Northwest');
