clear;
clear all;
close all;
% Temps fenêtre d'analyse
T = 1;

% nb points fft
M = 32;

% Période d'échantillonnage
Te = T/M;

% Temps de simulation
Tsim = T-Te;

% Fréquence de la sinusoïde (hz)
Fsin = 3;

SimOut = sim('model_simulink');% Link to Simulink

plot(SimOut.Tps_Cont, SimOut.Sin_Cont); % Plot Sin_Cont en fonction du temps

fourier = fft(SimOut.Sin_Cont);
%plot(fourier);