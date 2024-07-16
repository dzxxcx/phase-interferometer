% 测角误差-鉴相器误差
eps=0.00000001;
f = 5.8e9;  % 5.8GHz
c = 3e8;    % 光速
lambda = c/f;
d_lambda = 1/2;
dphi1 = 1*pi/180;
dphi3 = 3*pi/180;
dphi5 = 5*pi/180;
dlambda = 0;
theta = -80:1:80;
dtheta1 = dphi1./(2*pi*d_lambda*cosd(theta))+dlambda/lambda*tand(theta);
dtheta1 = dtheta1/pi*180;
dtheta3 = dphi3./(2*pi*d_lambda*cosd(theta))+dlambda/lambda*tand(theta);
dtheta3 = dtheta3/pi*180;
dtheta5 = dphi5./(2*pi*d_lambda*cosd(theta))+dlambda/lambda*tand(theta);
dtheta5 = dtheta5/pi*180;
plot(theta,dtheta1,theta,dtheta3,theta,dtheta5);
title('测角误差-鉴相器误差');xlabel('入射角度\theta(\circ)');ylabel('测角误差\Delta\theta(\circ)');
legend('\Delta\phi=1\circ','\Delta\phi=3\circ','\Delta\phi=5\circ');
