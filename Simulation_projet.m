clear;
clear all;
close all;
% Temps fen�tre d'analyse
T = 1/5000;

%Fr�quence d'�chantillonage
Fe=320000;

% P�riode d'�chantillonnage
Te=1/Fe;

% nb points fft
M = T/Te;

% Temps de simulation
Tsim = T-Te;

% Fr�quence de la sinuso�de (hz)
F1 = 85005.9;
F2 = 90000;
F3 = 94986.8;
F4 = 100000;
F5 = 115015.9;
F6 = 120000;


SimOut = sim('simulation_projet');% Link to Simulink

%x = (1:length(SimOut.Sin_Ech)/2);
%for i=x
%    SimOut.Sin_Ech(i) = 0;
%    SimOut.Sin_Cont(i) = 0;
%end N

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
f=(0:M-1)/T;
semilogy(f, abs(fourier),"*");
title('Transform�e de fourier');
xlabel('Fr�quence (Hz)');
ylabel('Amplitude');

%Fonction de transfert (filtre de Chebychev)
subplot(2,2,4);
filtre = tf(1,[1.7483*(10^-23) 7.6663*(10^-18) 1.162*(10^-11) 3.0332*(10^-6) 1]);
bode(filtre)