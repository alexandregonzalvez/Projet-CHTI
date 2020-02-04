# Projet CHTI
## Partie Signal

Chacun des 6 pistolets va émettre une onde sinusoïdale pendant un temps maximal de 100ms, à une fréquence bien déterminée. La discrimination de chacun des 6 faisceaux va se faire par une DFT pour chacune
des 6 fréquences. Sous MATLAB, on utilisera la FFT 
(qui peut le plus peu le moins, dans le sens ou la 
FFT calcule les M points fréquentiels, alors que dans le projet, on ne calculera que 6 points fréquentiels, ceux qui
nous intéressent).
Les fréquences retenues sont :
* F1 =  85 kHz
* F2 =  90 kHz
* F3 = 95 kHz
* F4 = 100 kHz
* F5 = 115 kHz
* F6 = 120 kHz

On impose une fréquence d'échantillonage Fe = 320kHz.

On détermine donc :
* T = 1/5000 (l'écart minimum de fréquence entre 2 joueurs)
* M = T/Te avec Te = 1/Fe 

Le bruit a une amplitude de l'ordre de 10^-14 tandis que l'amplitude du signal des joueurs est de l'ordre de 10^1
Avec notre matériel, on estime qu'un bruit avec une amplitude inférieure à 10^0 est négligeable.

Tracé : 
![Figure 1 : Tracé pour fréquences parfaites](/images/f_parfaites.jpg)

En réalité, l'émetteur possède une imprécision sur les canaux suivants :
* F1 =  85005,9 Hz
* F3 =  94986,8 Hz
* F5 =  115015,9 Hz

Quand on trace les courbes, on obtient les résultats suivants :

![Figure 1 : Tracé pour fréquences imparfaites](/images/f_imparfaites.jpg)

Comme on peut le voir, le bruit est monté à 10^-1. Ceci est acceptable comme il reste en-dessous de 10^0.



