soc_data = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0];
ocv_data = [3.0, 3.45, 3.68, 3.74, 3.77, 3.81, 3.87, 3.92, 4.00, 4.10, 4.2];
soc_interp = linspace(0, 1, 100);
%here (0,1) are the first and last values, and 100 is the number of spaces
%between them, it means it interpolates 100 times, with 0.01 iteration.
ocv_interp = interp1(soc_data, ocv_data, soc_interp, 'pchip');
plot(soc_interp, ocv_interp, 'r-', 'LineWidth', 2);
grid on;
xlabel('State of Charge (SOC)');
ylabel('Open Circuit Voltage (OCV)');
title('OCV vs SOC Interpolation');
legend('Interpolated OCV');
writematrix(ocv_interp', 'interpolated_ocv.csv');
