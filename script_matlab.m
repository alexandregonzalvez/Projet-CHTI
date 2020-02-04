clear;
clear all;
close all;
% Temps fen�tre d'analyse
T = 2;

% nb points fft
M = 32;

% P�riode d'�chantillonnage
Te = T/M;

% Temps de simulation
Tsim = T-Te;

% Fr�quence de la sinuso�de (hz)
Fsin = 5.5;

SimOut = sim('model_simulink');% Link to Simulink

subplot(2,2,1);
plot(SimOut.Tps_Cont, SimOut.Sin_Cont); % Plot Sin_Cont en fonction du temps
title('Sinuso�de continue');
xlabel('Temps (s)');
ylabel('Amplitude');

subplot(2,2,2);
plot(SimOut.Tps_Ech, SimOut.Sin_Ech,"."); 
title('Sinuso�de discr�te');
xlabel('Temps (s)');
ylabel('Amplitude');

subplot(2,2,3);
fourier = fft(SimOut.Sin_Ech);
f = (0:length(fourier) - 1)*M/length(fourier);
f=(0:M-1)/T
plot(f, abs(fourier),"*");
title('Transform�e de fourier');
xlabel('Fr�quence (Hz)');
ylabel('Amplitude');