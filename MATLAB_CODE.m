% Metamaterial-Enabled WPT Parameter Plots
clc;
clear;
close all;

%-------------------- Plot 1: Resonant Frequency vs Inductance --------------------%
L = linspace(0.5, 10, 100); % Inductance in µH
C = 100e-12; % Capacitance in Farads (100 pF)
f_res = 1 ./ (2 * pi * sqrt(L * 1e-6 * C)); % Resonant Frequency in Hz
f_res_MHz = f_res / 1e6; % Convert to MHz

figure;
subplot(2,2,1);
plot(L, f_res_MHz, 'b', 'LineWidth', 1.5);
xlabel('Inductance (\muH)');
ylabel('Resonant Frequency (MHz)');
title('Resonant Frequency vs Inductance');
grid on;

%-------------------- Plot 2: Output Power vs Load Impedance --------------------%
RL = linspace(0, 200, 100); % Load impedance in Ohms
V = 0.2; % Voltage in Volts
P_out = (V.^2) ./ RL; % Power in Watts
P_out(1) = 0; % Avoid Inf at RL=0

subplot(2,2,2);
plot(RL, P_out, 'b', 'LineWidth', 1.5);
xlabel('Load Impedance (Ohms)');
ylabel('Output Power (W)');
title('Output Power vs Load Impedance');
grid on;

%-------------------- Plot 3: Load Impedance vs Efficiency --------------------%
efficiency = (RL ./ max(RL)) * 170; % Arbitrary scaling to match %
subplot(2,2,3);
plot(RL, efficiency, 'b', 'LineWidth', 1.5);
xlabel('Load Impedance (RL) [Ohms]');
ylabel('Efficiency (%)');
title('Load Impedance vs Efficiency');
grid on;

%-------------------- Plot 4: Output Power vs Coupling Coefficient --------------------%
k = linspace(0, 1, 100); % Coupling coefficient
P_k = 8.5 * (k.^2); % Arbitrary scaling to match WPT behavior

subplot(2,2,4);
plot(k, P_k, 'b', 'LineWidth', 1.5);
xlabel('Coupling Coefficient (k)');
ylabel('Output Power (W)');
title('Output Power vs Coupling Coefficient');
grid on;
