%% 长短基线
clc;
clear all;
close all;

theta = -60:1:60;
x = 2*pi*sind(theta);
y = x + 0.2*randn(1, length(x));

% 短基线
d_lambda1 = 1/2;
deltaphi1 = d_lambda1*x/pi*180;
deltaphiz1 = d_lambda1*y/pi*180;

measurephiz1 = deltaphiz1;
for i = 1:length(measurephiz1)
    while measurephiz1(i) > 180 | measurephiz1(i) < -180
        if measurephiz1(i) > 180
            measurephiz1(i) = measurephiz1(i) - 360;
        elseif measurephiz1(i) < -180
            measurephiz1(i) = measurephiz1(i) + 360;
        end
    end
end

subplot(4,2,1)
plot(theta,deltaphi1,theta,measurephiz1);
title('短基线(d=\lambda/2)');
xlabel('入射角度\theta(\circ)');ylabel('相位差(\circ)');
legend('真实相位差','测量相位差','Location','Northwest');
grid on;

measuretheta1 = asind(measurephiz1/180*pi/(2*pi*d_lambda1));
subplot(4,2,2)
plot(theta,theta,theta,measuretheta1);
title('短基线(d=\lambda/2)');
xlabel('入射角度\theta(\circ)');ylabel('角度(\circ)');
legend('真实角度','估计角度','Location','Northwest');
axis([min(theta),max(theta),-60,60]);
grid on;

% 长基线
d_lambda2 = 1;
deltaphi2 = d_lambda2*x/pi*180;
deltaphiz2 = d_lambda2*y/pi*180;

measurephiz2 = deltaphiz2;
for i = 1:length(measurephiz2)
    while measurephiz2(i) > 180 | measurephiz2(i) < -180
        if measurephiz2(i) > 180
            measurephiz2(i) = measurephiz2(i) - 360;
        elseif measurephiz2(i) < -180
            measurephiz2(i) = measurephiz2(i) + 360;
        end
    end
end

subplot(4,2,3)
plot(theta,deltaphi2,theta,measurephiz2);
title('长基线(d=\lambda)');
xlabel('入射角度\theta(\circ)');ylabel('相位差(\circ)');
legend('真实相位差','估计相位差','Location','Northwest');
grid on;

measuretheta2 = asind(measurephiz2/180*pi/(2*pi*d_lambda2));
subplot(4,2,4)
plot(theta,theta,theta,measuretheta2);
title('长基线(d=\lambda)');
xlabel('入射角度\theta(\circ)');ylabel('角度(\circ)');
legend('真实角度','估计角度','Location','Northwest');
axis([min(theta),max(theta),-60,60]);
grid on;

% 长基线解模糊
phi2 = d_lambda2/d_lambda1*measurephiz1;
dphi2 = phi2;

subplot(4,2,5)
plot(theta,deltaphi2,theta,dphi2);
title('长基线解模糊');
xlabel('入射角度\theta(\circ)');ylabel('相位差(\circ)');
legend('真实相位差','估计相位差','Location','Northwest');
grid on;

measuretheta3 = asind(dphi2/180*pi/(2*pi*d_lambda2));
subplot(4,2,6)
plot(theta,theta,theta,measuretheta3);
title('长基线解模糊');
xlabel('入射角度\theta(\circ)');ylabel('角度(\circ)');
legend('真实角度','估计角度','Location','Northwest');
axis([min(theta),max(theta),-60,60]);
grid on;

% 误差
delta1 = measurephiz1 - deltaphi1;
delta2 = dphi2 - deltaphi2;
subplot(4,2,7)
plot(theta,delta1,theta,delta2);
title('相位误差');
xlabel('入射角度\theta(\circ)');ylabel('相位误差(\circ)');
legend('短基线误差','长基线解模糊误差','Location','Northwest');
axis([min(theta),max(theta),-40,40]);
grid on;

deltat1 = measuretheta1 - theta;
deltat2 = measuretheta3 - theta;
subplot(4,2,8)
plot(theta,deltat1,theta,deltat2);
title('角度误差');
xlabel('入射角度\theta(\circ)');ylabel('角度误差(\circ)');
legend('短基线误差','长基线解模糊误差','Location','Northwest');
axis([min(theta),max(theta),-40,40]);
grid on;
