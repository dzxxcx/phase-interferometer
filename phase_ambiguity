%相位模糊
d_lambda = 1/3;
theta = -180:1:180;
deltaphi = 2*pi*d_lambda*sind(theta);
deltaphi = deltaphi/pi*180;
measurephi = deltaphi;
for i = 1:length(measurephi)
    while measurephi(i) > 180 | measurephi(i) < -180
        if measurephi(i) > 180
            measurephi(i) = measurephi(i) - 360;
        elseif measurephi(i) < -180
            measurephi(i) = measurephi(i) + 360;
        end
    end
end
figure;
plot(theta,deltaphi,theta,measurephi);
title('相位模糊示意图');
xlabel('入射角度\theta(\circ)');ylabel('相位差(\circ)');
legend('真实相位差','测量相位差','Location','Northwest');
grid on;
