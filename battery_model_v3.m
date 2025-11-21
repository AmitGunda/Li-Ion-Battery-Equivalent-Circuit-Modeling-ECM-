importdata battery_model_v1.m
importdata battery_model_v2.m
Capacity_Ah=4;
Capacity_As=Capacity_Ah*3600;
Charge_used=cumsum(I)*1;
SoC_vector=current_soc-(Charge_used/Capacity_As);
Vocv_dynamic = interp1(soc_data, ocv_data, SoC_vector, 'pchip');
V_terminal=Vocv_dynamic-(I*R0);
subplot(3,1,1);
plot (t,I,'r-', 'Linewidth', 1.5);
grid on;
xlabel('Time(t)');
ylabel('Current(A)');
subplot(3,1,2);
plot (t, V_terminal,'r-', 'Linewidth', 1.5);
grid on;
xlabel('Time(t)');
ylabel('Terminal Voltage');
subplot(3,1,3);
plot (t, SoC_vector,'r-', 'Linewidth', 1.5);
grid on;
xlabel('Time(t)');
ylabel('SoC');
